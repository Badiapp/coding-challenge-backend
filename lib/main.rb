# frozen_string_literal: true

require_relative 'plane/base.rb'
require_relative 'plane/long_range.rb'
require_relative 'plane/short_range.rb'
require_relative 'plane/services/seat_position_service.rb'
require_relative 'booking/base.rb'
require_relative 'booking/services/find_seat_service.rb'

plane = Plane::LongRange.new('AR123')
booking = Booking::Base.new(plane)
puts booking.id

puts booking.seat('B15').inspect
# nil

puts booking.book!('B15', 'Marco')
# true

# puts booking.book!('B15', 'Marco')
# /Users/mtanzi/work/code/backend-challenge/lib/booking/seat.rb:20:in `book!': Seat already booked (Booking::BookingError)
#         from /Users/mtanzi/work/code/backend-challenge/lib/booking/base.rb:28:in `book!'
#         from lib/main.rb:15:in `<main>'

puts booking.booked?('B15')
# true

puts booking.seat('B15')
# Marco

puts booking.unbook!('B15')
# true

puts booking.booked?('B15')
# false
