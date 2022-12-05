class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matches, foreign_key: 'matcher_id', class_name: 'Match', dependent: :destroy
  has_many :matches, foreign_key: 'matchee_id', class_name: 'Match', dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  GENDER = ["Male", "Female"]
  validates :first_name, :age, :gender, presence: true
  validates :first_name, length: { minimum: 3 }
  validates_numericality_of :age, only_integer: true
  # reverse_geocoded_by :address
  # after_validation :geocode
end
