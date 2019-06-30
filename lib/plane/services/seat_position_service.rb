# frozen_string_literal: true

require_relative './find_lane_service.rb'

module Plane
  module Services
    # :nodoc:
    class SeatPositionService
      def initialize(plane, seat_number)
        @plane = plane
        @seat_number = seat_number
      end

      def call
        split_seat_name
      end

      def split_seat_name
        lanes_position.merge(row: row)
      end

      def row
        @seat_number[1..-1].to_i
      end

      def lanes_position
        Plane::Services::FineLaneService.new(@plane, lane_letter).call
      end

      def lane_letter
        @seat_number[0]
      end
    end
  end
end
