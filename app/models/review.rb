class Review < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :content, presence: true, allow_blank: false, length: { maximum: 500 , 
    too_long: "There is a maximum of 500 characters!"}
  validates :rating, presence: true, numericality: {only_integer: true}, inclusion: { in: [*0..10] }
end
