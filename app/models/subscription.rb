class Subscription < ApplicationRecord
  belongs_to :activity
  belongs_to :client
  has_many :payments, dependent: :destroy

  validates :initial_date, presence: true

  def can_access
    subscription = Subscription.where(
':today BETWEEN initial_date AND end_date AND activity_id = :activity_id AND client_id = :client_id', {
today: Date.today, activity_id: activity_id, client_id: client_id }).first

    if subscription && payed
      true
    else
      false
    end
  end

  scope :current_subscription, lambda {where(initial_date: Time.now.beginning_of_month..(Time.now.end_of_month))}
end
