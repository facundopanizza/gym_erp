class Payment < ApplicationRecord
  belongs_to :subscription

  validates :amount, presence: true, numericality: true
end
