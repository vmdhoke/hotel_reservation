class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  validate :booking_before_six_months

  def booking_before_six_months
  	errors.add(:booking_to, "Booking should be done before six months") unless self.booking_to < (Date.today + 180.days)
  end
end
