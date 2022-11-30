class Match < ApplicationRecord
  enum :status, { pending: 0, declined: 1, accepted: 2 }
  has_many :doggy_dates
  belongs_to :matcher, class_name: "User", foreign_key: 'matcher_id'
  belongs_to :matchee, class_name: "User", foreign_key: 'matchee_id'
  has_many :messages

  validates_uniqueness_of :matchee_id, { scope: :matcher_id }
  validates :matchee_id, comparison: { other_than: :matcher_id }
end

# Match.statuses
# match = Match.find(3)
# math.update(status: "accepted")
