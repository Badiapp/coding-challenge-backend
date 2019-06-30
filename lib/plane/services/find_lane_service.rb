# typed: false
# frozen_string_literal: true

module Plane
  module Services
    # :nodoc:
    class FineLaneService
      LETTERS = ('A'..'Z').to_a

      def initialize(plane, lane_letter)
        @plane = plane
        @lane_letter = lane_letter
      end

      def call
        find_lane_position
      end

      def find_lane_position
        position = lanes_hash.each do |lane, seat_positions|
          next unless seat_positions.include?(@lane_letter)

          lane_position = seat_positions.find_index(@lane_letter) + 1

          return { lane: lane, lane_position: lane_position }
        end

        raise PlaneError, 'Seat position not found.' unless position

        position
      end

      def lanes_hash
        res = {}
        lanes_arrangment.each_with_index do |lane_size, index|
          res[index + 1] = LETTERS.shift(lane_size)
        end

        res
      end

      def lanes_arrangment
        @plane.class::LANES_SEAT_NUM.values
      end
    end
  end
end
