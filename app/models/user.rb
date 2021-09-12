class User < ApplicationRecord
  belongs_to :teacher

  has_secure_password

  validates :email, :password, :teacher_id, presence: true
  validates :email, uniqueness: true
  validates :teacher_id, uniqueness: true

  def to_s
    teacher.to_s
  end
end
