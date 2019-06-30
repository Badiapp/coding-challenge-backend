# frozen_string_literal: true

require_relative 'bookings.rb'
require_relative 'planes.rb'

plane = Planes.new(:short_range, 'AR123').create
booking = Bookings.new(plane)

puts "booking.id: #{booking.id}"
# puts booking.id

puts "booking.seat('B15').inspect: #{booking.seat('B15').inspect}"
# puts booking.seat('B15').inspect
# nil

puts "booking.book!('B15', 'Marco'): #{booking.book!('B15', 'Marco')}"
# puts booking.book!('B15', 'Marco')
# true

# puts booking.book!('B15', 'Marco')
# /Users/mtanzi/work/code/backend-challenge/lib/booking/seat.rb:20:in `book!': Seat already booked (Booking::BookingError)
#         from /Users/mtanzi/work/code/backend-challenge/lib/booking/base.rb:28:in `book!'
#         from lib/main.rb:15:in `<main>'

puts "booking.booked?('B15'): #{booking.booked?('B15')}"
# puts booking.booked?('B15')
# true

puts "booking.seat('B15'): #{booking.seat('B15')}"
# puts booking.seat('B15')
# Marco

puts "booking.unbook!('B15'): #{booking.unbook!('B15')}"
# putsbooking.unbook!('B15')
# true

puts "booking.booked?('B15'): #{booking.booked?('B15')}"
# false
