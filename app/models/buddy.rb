class Buddy < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :goal, presence: true
end
