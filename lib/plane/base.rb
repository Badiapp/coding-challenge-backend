# typed: true
# frozen_string_literal: true

module Plane
  PlaneError = Class.new(StandardError)

  # :nodoc:
  class Base
    attr_accessor :type, :number, :lanes, :rows

    def initialize(number, type, lanes, rows)
      @number = number
      @type = type
      @lanes = lanes
      @rows = rows
    end
  end
end
