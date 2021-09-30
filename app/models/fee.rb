class Fee < ApplicationRecord
  belongs_to :subscription
  has_one :payment

  scope :current_fee, lambda {where(initial_date: Time.now.beginning_of_month..(Time.now.end_of_month))}
end
