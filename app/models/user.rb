class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matches, foreign_key: 'matcher_id', dependent: :destroy
  has_many :matches, foreign_key: 'matchee_id', dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  has_many :notifications, foreign_key: :recipient_id
  GENDER = ["Male", "Female"]
  validates :first_name, :age, :gender, presence: true
  validates :first_name, length: { minimum: 3 }
  validates_numericality_of :age, only_integer: true
  has_many :doggy_dates, through: :matches
  # reverse_geocoded_by :address
  # after_validation :geocode

  enum :pref_age, { no_age: 0, puppy: 1, adult: 2, senior: 3 }
  enum :pref_gender, { no_gender: 0, female: 1, male: 2 }
  enum :pref_size, { no_size: 0, small: 1, medium: 2, large: 3 }
  enum :pref_personality, { no_personality: 0, slow: 1, shy: 2, friendly: 3, rough: 4, independent: 5, energetic: 6 }
end
