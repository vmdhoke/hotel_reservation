class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :users, :through => :bookings
end
