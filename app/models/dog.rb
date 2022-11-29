class Dog < ApplicationRecord
  has_many_attached :img
  belongs_to :user
  GENDER = ["male", "female"]
  SIZE = ["tiny", "small", "medium", "large", "horse"]
  PERSONALITY = ["fast", "slow", "aggressive", "loyal", "funny", "loud", "quiet", "curious", "energetic", "friendly", "playful"]
end
