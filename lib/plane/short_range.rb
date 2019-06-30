# frozen_string_literal: true

module Plane
  # :nodoc:
  class ShortRange < Plane::Base
    TYPE = :short_range
    LANES_SEAT_NUM = {
      left: 3,
      right: 3
    }.freeze

    ROWS_NUMBER = 26

    def initialize(number)
      super(number, TYPE, LANES_SEAT_NUM, ROWS_NUMBER)
    end
  end
end
