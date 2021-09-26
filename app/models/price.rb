class Price < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :activity
end
