class Subscription < ApplicationRecord
  belongs_to :activity
  belongs_to :client
  has_many :fees, dependent: :destroy
end
