class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :houses, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # Accessing users own booked houses >>
  has_many :booked_houses, through: :bookings, source: :house
  has_one_attached :photo
  has_many :reviews
end
