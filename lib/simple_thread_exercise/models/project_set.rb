#!/usr/bin/env ruby
# encoding: utf-8
#
# author: Kyle Yetter
#

require 'simple_thread_exercise'

module SimpleThreadExercise
  module Models
    class ProjectSet
      include Virtus.model

      attribute :name, String
      attribute :projects, Array[Project]
    end
  end
end
