# typed: true
# frozen_string_literal: true

require_relative 'lane.rb'

module Booking
  # :nodoc:
  class Board
    attr_reader :position

    def initialize(lanes, rows)
      @position = Array.new(lanes.count)

      lanes.each_with_index do |(position, columns), index|
        @position[index] = Booking::Lane.new(position, columns, rows)
      end
    end
  end
end
