# frozen_string_literal: true

require 'securerandom'
require_relative 'board.rb'

module Booking
  BookingError = Class.new(StandardError)
  # :nodoc:
  class Base
    attr_accessor :id, :board, :plane

    def initialize(plane)
      @plane = plane
      @id = generate_id
      @board = create_board(plane.lanes, plane.rows)
    end

    # This method receive a seat position and is the seat is available it
    # returns the booking status.
    # If the seat is not valid the method will return an error.
    #
    # Example:
    #   irb> Booking::Base.book('A12')
    #   => true
    #
    def book!(seat_position, name)
      seat = find_seat(seat_position)

      seat.book!(name)
    end

    # The booked? method returns a boolean describing the status of the seat,
    # `true` if the seat is booked already otherwise `false`
    # If the seat is not valid the method will return an error.
    #
    # Example:
    #   irb> Booking::Base.booked?('A12')
    #   => true
    #
    def booked?(seat_position)
      seat = find_seat(seat_position)

      seat.booked?
    end

    def unbook!(seat_position)
      seat = find_seat(seat_position)

      seat.unbook!
    end

    def seat(seat_position)
      seat = find_seat(seat_position)

      seat.who?
    end

    private

    # The booking reference contain teh plane number and a random generated
    # string to garante the uniqueness.
    def generate_id
      "#{@plane.number}-#{SecureRandom.hex(4)}"
    end

    def create_board(lanes, rows)
      Booking::Board.new(lanes, rows)
    end

    def find_seat(seat_position)
      @find_seat ||=
        Booking::Services::FindSeatService.new(self, seat_position).call
    end
  end
end
