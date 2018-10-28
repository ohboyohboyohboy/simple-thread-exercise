#!/usr/bin/env ruby
# encoding: utf-8
#
# author: Kyle Yetter
#

require 'simple_thread_exercise'

module SimpleThreadExercise
  module Models
    class Project
      include Virtus.model
      include Comparable
      include SimpleThreadExercise::Constants

      attribute :name, String
      attribute :location, String
      attribute :start, Date
      attribute :end, Date

      def initialize(*args)
        super

        self.end ||= self.start

        if self.end < self.start
          self.start, self.end = self.end, self.start
        end
      end

      def location_rank
        LOCATION_RANKS[self.location]
      end
    end
  end
end

