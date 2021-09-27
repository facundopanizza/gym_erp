class Activity < ApplicationRecord
  has_one :price, dependent: :destroy
  accepts_nested_attributes_for :price, allow_destroy: true

  def to_label
    "#{name} / #{ price.amount}"
  end
end
