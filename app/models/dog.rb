class Dog < ApplicationRecord
  GENDER = ["male", "female"]
  SIZE = ["tiny", "small", "medium", "large", "horse"]
  PERSONALITY = ["fast", "slow", "aggressive", "loyal", "funny", "loud", "quiet", "curious", "energetic", "friendly", "playful"]
  AGE = (0..29)
  has_many_attached :photos
  belongs_to :user
  validates :name, :age, :gender, :size, :breed, presence: true
end
