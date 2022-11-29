class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDER = ["male", "female", "other"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :gender, inclusion: { in: GENDER }
  validates_numericality_of :age, only_integer: true
  has_many :dogs
end
