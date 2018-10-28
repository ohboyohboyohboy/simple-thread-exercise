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
      include SimpleThreadExercise::Constants

      attribute :name, String
      attribute :projects, Array[Project]

      def total_cost
        @total_cost ||= calculate_cost
      end

      def ordered_projects
        self.projects.to_a.compact.sort_by(&:start)
      end

      private

      def calculate_cost
        return 0.0 if projects.empty?

        projects = self.ordered_projects
        counts   = Hash.new { |h, location| h[location] = [ 0, 0 ] }

        projects_on_day  = ->(date) { projects.select { |pr| date.between?(pr.start, pr.end) } }
        location_for_day = ->(date) { projects_on_day[date].max_by(&:location_rank).location }
        add_travel_day   = ->(date) { counts[location_for_day[date]][0] += 1 }
        add_full_day     = ->(date) { counts[location_for_day[date]][1] += 1 }

        each_cost_period do |r_start, r_end|
          add_travel_day[r_start]
          day_span = (r_end - r_start).to_i
          if day_span > 0
            add_travel_day[r_end]
            (r_start + 1).upto(r_end - 1) { |d| add_full_day[d] }
          end
        end

        counts.inject(0.0) do |total_price, (location, (travel, full))|
          travel_price, full_price = PROJECT_COSTS_BY_LOCATION[location]
          total_price + (travel * travel_price + full * full_price)
        end
      end

      def each_cost_period
        return enum_for(__method__) unless block_given?
        first, *following = self.ordered_projects
        range_start       = first.start
        range_end         = first.end

        following.each do |proj|
          if proj.start.between?(range_start, range_end + 1)
            range_end = [range_end, proj.end].max
          else
            yield(range_start, range_end)
            range_start, range_end = proj.start, proj.end
          end
        end

        yield(range_start, range_end)
      end
    end
  end
end
