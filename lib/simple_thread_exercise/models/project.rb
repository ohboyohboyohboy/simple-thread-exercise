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

      attribute :name, String
      attribute :location, String
      attribute :start, Date
      attribute :end, Date

      def range
        (self.start) .. (self.end)
      end
    end
  end
end

