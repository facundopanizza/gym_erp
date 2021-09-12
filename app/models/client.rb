class Client < ApplicationRecord
  validates :first_name, :last_name, :dni, :birthday, :phone_number, :email, presence: true
  validates :dni, uniqueness: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
