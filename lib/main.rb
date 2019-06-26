# frozen_string_literal: true

require_relative 'plane/base.rb'
require_relative 'plane/long_range.rb'
require_relative 'plane/short_range.rb'
require_relative 'booking/base.rb'

plane = Plane::LongRange.new('AR123')
# puts s.inspect

booking = Booking::Base.new(plane)

# binding.pry
puts booking.board.position[2].seats[0][1]

# booking.book('A12')
# ~> true

# booking.book('A12')
# ~> Booking::Error("The seat is already booked.")

# booking.booked?('A12')
# ~> true

# booking.booked?('A13')
# ~> false

# booking.booked?('A99')
# ~> Booking::Error("The seat does not exist.")
