class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :mobile, :email, presence: true
  validates :mobile, numericality: { only_integer: true }, length: { is: 10 }
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email address" }
end
