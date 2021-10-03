require 'barby/barcode/code_128'
require 'barby/barcode'
require 'barby/outputter/cairo_outputter'

class Client < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_one_attached :medic_file, dependent: :destroy

  validates :first_name, :last_name, :dni, :birthday, :phone_number, :email, presence: true
  validates :dni, uniqueness: true

  def to_s
    "#{first_name} #{last_name}"
  end

  def can_access
    current_subscription = subscriptions.current_subscription

    if current_subscription.empty?
      return false
    end

    current_subscription.first.payed
  end

  def activities
    @subscriptions = Subscription.where(client_id: id).eager_load(:activity).group_by(&:activity_id)
  end

  def get_barcode
    barcode = Barby::Code128B.new(dni)
    outputter = Barby::CairoOutputter.new(barcode)
    outputter.height = 90
    outputter.xdim = 2

    Base64.encode64(outputter.to_png)
  end
end
