class Dog < ApplicationRecord
  GENDER = ["male", "female"]
  SIZE = ["tiny", "small", "medium", "large", "horse"]
  PERSONALITY = ["fast", "slow", "aggressive", "loyal", "funny", "loud", "quiet", "curious", "energetic", "friendly", "playful"]
  AGE = (0..29)
  belongs_to :user
  has_many_attached :img
end
