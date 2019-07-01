# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'
require 'securerandom'

require_relative 'plane/base.rb'
require_relative 'plane/long_range.rb'
require_relative 'plane/short_range.rb'
require_relative 'plane/services/seat_position_service.rb'

# :nodoc:
class Planes
  extend T::Sig

  def initialize(type, code)
    @type = type
    @code = code
  end

  sig { returns(T.any(Plane::LongRange, Plane::ShortRange)) }
  def create
    if @type == :long_range
      Plane::LongRange.new(@code)
    elsif @type == :short_range
      Plane::ShortRange.new(@code)
    else
      Plane::PlaneError.new('Plane type not supported')
    end
  end
end
