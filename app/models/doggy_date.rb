class DoggyDate < ApplicationRecord
  enum :status, { pending: 0, declined: 1, accepted: 2 }
  belongs_to :message
  belongs_to :match
  validates :date, presence: true
end
