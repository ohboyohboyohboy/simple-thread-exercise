#!/usr/bin/env ruby
# encoding: utf-8
#
# author: Kyle Yetter
#

require 'simple_thread_exercise'

module SimpleThreadExercise
  module Constants
    HIGH_COST_CITY = 'high'.freeze
    LOW_COST_CITY  = 'low'.freeze

    PROJECT_COSTS_BY_LOCATION =
      Hash.new do |city_name|
        warn("City prices have not been defined for value #{ city_name.inspect } - assuming no cost")
        [ 0.0, 0.0 ]
      end

    # costs are defined by a two-value array [ travel, full ]
    PROJECT_COSTS_BY_LOCATION[LOW_COST_CITY]  = [ 45.0, 75.0 ].freeze
    PROJECT_COSTS_BY_LOCATION[HIGH_COST_CITY] = [ 55.0, 85.0 ].freeze

    PROJECT_COSTS_BY_LOCATION.freeze
  end
end
