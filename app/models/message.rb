class Message < ApplicationRecord
  belongs_to :match
  belongs_to :user
  has_one :doggy_date, dependent: :destroy

  validates :content, presence: true
end
