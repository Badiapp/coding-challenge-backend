# typed: strong
# frozen_string_literal: true

require 'securerandom'
require_relative 'board.rb'

module Booking
  BookingError = Class.new(StandardError)
end
