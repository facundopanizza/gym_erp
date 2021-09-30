require 'barby/barcode/code_128'
require 'barby/barcode'
require 'barby/outputter/cairo_outputter'

class Client < ApplicationRecord
  has_many :subscriptions
  has_one_attached :medic_file

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
    Subscription.where(client_id: id).select('*').distinct.eager_load(:activity)
  end

  def get_barcode
    fname = "#{dni}.png"

    barcode = Barby::Code128B.new(dni)
    outputter = Barby::CairoOutputter.new(barcode)
    outputter.height = 90
    outputter.xdim = 2

    File.open(fname, 'w') { |f| f.write outputter.to_png }

    Base64.encode64(outputter.to_png)
  end
end
