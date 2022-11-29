class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matches
  has_many :dogs
  has_many :messages
  GENDER = ["Male", "Female"]
  validates :first_name, :age, :gender, presence: true
  validates :first_name, length: { minimum: 3 }
end
