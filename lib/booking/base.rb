# frozen_string_literal: true

require_relative 'board.rb'

module Booking
  # :nodoc:
  class Base
    attr_accessor :board

    def initialize(plane)
      @id = generate_id
      @number = plane.number
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
    def book(seat, name)
      # TODO
    end

    # The booked? method returns a boolean describing the status of the seat,
    # `true` if the seat is booked already otherwise `false`
    # If the seat is not valid the method will return an error.
    #
    # Example:
    #   irb> Booking::Base.booked?('A12')
    #   => true
    #
    def booked?(seat)
      # TODO
    end

    def generate_id
      
    end

    private

    def create_board(lanes, rows)
      Booking::Board.new(lanes, rows)
      # grid = Array.new(lanes.count)
      #
      # lanes.each_with_index do |(position, columns), index|
      #   grid[index] = Booking::Lane.new(position, columns, rows)
      # end
      #
      # grid
    end
  end
end
