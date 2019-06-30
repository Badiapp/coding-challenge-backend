# frozen_string_literal: true

module Plane
  # :nodoc:
  class LongRange < Plane::Base
    TYPE = :long_range
    LANES_SEAT_NUM = {
      left: 3,
      middle: 4,
      right: 3
    }.freeze

    ROWS_NUMBER = 36

    def initialize(number)
      super(number, TYPE, LANES_SEAT_NUM, ROWS_NUMBER)
    end
  end
end
