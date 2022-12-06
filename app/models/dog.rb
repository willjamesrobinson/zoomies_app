class Dog < ApplicationRecord
  GENDER = ["male", "female"]
  SIZE = ["tiny", "small", "medium", "large", "horse"]
  PERSONALITY = ["fast", "slow", "aggressive", "loyal", "funny", "loud", "quiet", "curious", "energetic", "friendly", "playful"]
  AGE = (0..29)
  has_many_attached :photos
  belongs_to :user
  validates :name, :age, :gender, :size, :breed, presence: true


  scope :filter_by_location, ->(location_id) { where location_id: location_id }
  scope :filter_by_age, ->(age) { where age: age }
  scope :filter_by_gender, ->(gender) { where gender: gender }
  scope :filter_by_size, ->(size) { where size: size }
  scope :filter_by_personality, ->(personality) { where personality: personality }
end
