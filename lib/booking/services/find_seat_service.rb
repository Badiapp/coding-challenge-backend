# frozen_string_literal: true

module Booking
  module Services
    # :nodoc:
    class FindSeatService
      def initialize(booking, seat_number)
        @booking = booking
        @seat_number = seat_number
      end

      def call
        fetch_seat
      end

      private

      def fetch_seat
        @booking.board
                .position[seat_position[:lane]]
                .seats[seat_position[:lane_position]][seat_position[:row]]
      end

      def seat_position
        @seat_position ||=
          Plane::Services::SeatPositionService.new(plane, @seat_number).call
      end

      def plane
        @booking.plane
      end
    end
  end
end
