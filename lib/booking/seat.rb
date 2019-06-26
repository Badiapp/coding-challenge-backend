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
  end
end
