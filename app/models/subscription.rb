class Subscription < ApplicationRecord
  belongs_to :activity
  belongs_to :client
  has_many :payments, dependent: :destroy

  scope :current_subscription, lambda {where(initial_date: Time.now.beginning_of_month..(Time.now.end_of_month))}
end
