class Teacher < ApplicationRecord
  validates :first_name, :last_name, :dni, :birthday, :phone_number, presence: true
  validates :dni, uniqueness: true

  def to_label
    "#{first_name} #{last_name} / #{dni}"
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
