# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
deluxe_room = RoomType.create(name: 'Deluxe Rooms',description: 'Queen Size Bed',tariff: 7_000)
luxury_room = RoomType.create(name: 'Luxury Rooms',description: 'Queen Size Bed and Pool Facing', tariff: 8_000)
luxury_suit = RoomType.create(name: 'Luxury Suites',description: 'King Size Bed and Pool Facing', tariff: 12_000)
presidential_suit = RoomType.create(name: 'Presidential Suites',description: 'King Size Bed, Pool Facing with a Gym', tariff: 20_000)

presidential_suit.rooms.create(name:'E03')
presidential_suit.rooms.create(name:'E04')
presidential_suit.rooms.create(name:'E05')
presidential_suit.rooms.create(name:'E06')
presidential_suit.rooms.create(name:'E07')
presidential_suit.rooms.create(name:'E08')
presidential_suit.rooms.create(name:'E09')
presidential_suit.rooms.create(name:'E10')

luxury_suit.rooms.create(name: 'D10')
luxury_suit.rooms.create(name: 'D11')
luxury_suit.rooms.create(name: 'D12')
luxury_suit.rooms.create(name: 'D13')
luxury_suit.rooms.create(name: 'D14')
luxury_suit.rooms.create(name: 'D15')
luxury_suit.rooms.create(name: 'D16')
luxury_suit.rooms.create(name: 'D17')
luxury_suit.rooms.create(name: 'D18')
luxury_suit.rooms.create(name: 'D19')
luxury_suit.rooms.create(name: 'D20')

luxury_room.rooms.create(name: 'A06')
luxury_room.rooms.create(name: 'B06')
luxury_room.rooms.create(name: 'C06')
luxury_room.rooms.create(name: 'D06')

luxury_room.rooms.create(name: 'A07')
luxury_room.rooms.create(name: 'B07')
luxury_room.rooms.create(name: 'C07')
luxury_room.rooms.create(name: 'D07')

luxury_room.rooms.create(name: 'A08')
luxury_room.rooms.create(name: 'B08')
luxury_room.rooms.create(name: 'C08')
luxury_room.rooms.create(name: 'D08')

luxury_room.rooms.create(name: 'A09')
luxury_room.rooms.create(name: 'B09')
luxury_room.rooms.create(name: 'C09')
luxury_room.rooms.create(name: 'D09')

luxury_room.rooms.create(name: 'A10')
luxury_room.rooms.create(name: 'B10')
luxury_room.rooms.create(name: 'C10')
luxury_room.rooms.create(name: 'D10')




deluxe_room.rooms.create(name: 'A01')
deluxe_room.rooms.create(name: 'B01')
deluxe_room.rooms.create(name: 'C01')
deluxe_room.rooms.create(name: 'D01')

deluxe_room.rooms.create(name: 'A02')
deluxe_room.rooms.create(name: 'B02')
deluxe_room.rooms.create(name: 'C02')
deluxe_room.rooms.create(name: 'D02')

deluxe_room.rooms.create(name: 'A03')
deluxe_room.rooms.create(name: 'B03')
deluxe_room.rooms.create(name: 'C03')
deluxe_room.rooms.create(name: 'D03')

deluxe_room.rooms.create(name: 'A04')
deluxe_room.rooms.create(name: 'B04')
deluxe_room.rooms.create(name: 'C04')
deluxe_room.rooms.create(name: 'D04')

deluxe_room.rooms.create(name: 'A05')
deluxe_room.rooms.create(name: 'B05')
deluxe_room.rooms.create(name: 'C05')
deluxe_room.rooms.create(name: 'D05')

User.create(name: 'Vaibhav',email:'vmdhoke@gmail.com',password: '12345678')

room_type = RoomType.last
rooms = room_type.rooms


d = '15/03/2016'.to_datetime
e = '25/03/2016'.to_datetime

rooms.each do |room|
	Booking.create(user_id:1,room_id:room.id,booking_from:d,booking_to:e, payment:(e-d).to_i * room_type.tariff)
end