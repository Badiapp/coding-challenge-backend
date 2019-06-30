# frozen_string_literal: true

module Booking
  # :nodoc:
  class Seat
    attr_accessor :position, :booked
    ALPHABET = ('A'..'Z').to_a

    def initialize(column, row)
      @column = ALPHABET[column]
      @row = row
      @booked = nil
    end

    def booked?
      !@booked.nil?
    end

    def book!(name)
      raise Booking::BookingError, 'Seat already booked' if booked?

      @booked = name
      true
    end

    def unbook!
      @booked = nil
      true
    end

    def who?
      @booked
    end
  end
end
