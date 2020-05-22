class Booking < ApplicationRecord
  belongs_to :house
  belongs_to :user

  validate :check_availability

  def check_availability
    query = "house_id= ? AND checkin= ? AND checkout= ?", self.house.id, "%#{self.checkin}%", "%#{self.checkout}%"
    # raise
    if Booking.where(query).exists?
      error_message = "this treehouse is not available for the given date"
      errors.add(:checkin, error_message)
      errors.add(:checkout, error_message)
    end
  end
end
