class Match < ApplicationRecord
  enum :status, { pending: 0, declined: 1, accepted: 2 }
  has_many :doggy_dates
  belongs_to :matcher, class_name: "User", foreign_key: 'matcher_id'
  belongs_to :matchee, class_name: "User", foreign_key: 'matchee_id'
  has_many :messages

  validates_uniqueness_of :matchee_id, { scope: :matcher_id }
  validates :matchee_id, comparison: { other_than: :matcher_id }

  # broadcasts_to ->(match) { [match.matchee, :matches] }, inserts_by: :prepend, target: "user_#{matchee_id}_matches"
  # after_create_commit :broadcast
  # after_create_commit -> { broadcast_prepend_to helpers.dom_id(matchee, :matches), partial: "matches/match", locals: { match: self }, target: helpers.dom_id(matchee, :matches) }

  # For create, currrent_user is matcher
  after_create_commit -> { broadcast_prepend_to "user_#{matchee.id}_pending_matches", partial: "matches/match", locals: { match: self }, target: "pending_matches" }
  after_update_commit -> { broadcast_remove_to "user_#{matchee.id}_pending_matches" }
  after_update_commit -> { broadcast_prepend_to "user_#{matchee.id}_pending_matches", partial: "matches/match", locals: { match: self }, target: "pending_matches" }

  after_update_commit -> { broadcast_remove_to "user_#{matcher.id}_pending_matches" }
  after_update_commit -> { broadcast_prepend_to "user_#{matcher.id}_pending_matches", partial: "matches/match", locals: { match: self }, target: "pending_matches" }

  # private
  # def broadcast
  #   broadcast_prepend_to matchee, :matches
  # end

end

# Match.statuses
# match = Match.find(3)
# math.update(status: "accepted")

# class Clearance < ApplicationRecord
  #     belongs_to :petitioner, class_name: "Contact"
  #     belongs_to :examiner,   class_name: "User"
  #
  #     after_create_commit :broadcast_later
  #
  #     private
  #       def broadcast_later
  #         broadcast_prepend_later_to examiner.identity, :clearances
  #       end
  #   end
