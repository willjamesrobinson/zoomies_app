class Match < ApplicationRecord
  enum :status, { pending: 0, declined: 1, accepted: 2 }
  belongs_to :matcher, class_name: "User", foreign_key: 'matcher_id'
  belongs_to :matchee, class_name: "User", foreign_key: 'matchee_id'
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :matchee_id, { scope: :matcher_id }
  validates :matchee_id, comparison: { other_than: :matcher_id }

  # For create, currrent_user is matcher
  after_create_commit -> { broadcast_prepend_to "user_#{matchee.id}_pending_matches", partial: "matches/match", locals: { match: self }, target: "pending_matches" }
  # after_create_commit -> { broadcast_remove_to "user_#{matcher.id}_pending_matches" }

  # For update, currrent_user is matchee
  after_update_commit -> { broadcast_remove_to "user_#{matchee.id}_pending_matches" }
  # after_update_commit -> { broadcast_prepend_to "user_#{matcher.id}_pending_matches", partial: "matches/match", locals: { match: self }, target: "pending_matches" }

  # after_update_commit -> { broadcast_prepend_to "user_#{matchee.id}_pending_matches", partial: "matches/match", locals: { match: self }, target: "pending_matches" }
  # after_update_commit -> { broadcast_remove_to "user_#{matcher.id}_pending_matches" }
end
