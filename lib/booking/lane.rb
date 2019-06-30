# typed: true
# frozen_string_literal: true

require_relative 'seat.rb'

module Booking
  # :nodoc:
  class Lane
    attr_reader :position, :seats

    def initialize(position, columns, rows)
      @position = position
      @seats = create_seats(columns, rows)
    end

    def create_seats(columns, rows)
      1.upto(columns).map do |column|
        1.upto(rows).map do |row|
          Booking::Seat.new(column, row)
        end
      end
    end
  end
end
