#!/usr/bin/env ruby
# encoding: utf-8
#
# author: Kyle Yetter
#

require 'virtus'
require "simple_thread_exercise/version"

module SimpleThreadExercise
  autoload :Constants,      'simple_thread_exercise/constants'
  autoload :Models,         'simple_thread_exercise/models'
end
