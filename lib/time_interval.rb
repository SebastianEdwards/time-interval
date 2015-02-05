require 'time_interval/version'

require 'active_support/all'

require 'time_interval/duration'
require 'time_interval/repeating_interval'
require 'time_interval/time_pair'
require 'time_interval/time_with_duration'

module TimeInterval
  module_function

  def interval?(iso8601)
    iso8601['/'] == '/'
  end

  def repeating?(iso8601)
    !iso8601.match(/^R/).nil?
  end

  def duration?(iso8601)
    iso8601['P'] == 'P'
  end

  def parse(iso8601)
    if interval? iso8601
      if repeating?(iso8601) && duration?(iso8601)
        RepeatingInterval.parse iso8601
      elsif duration? iso8601
        TimeWithDuration.parse iso8601
      else
        TimePair.parse iso8601
      end
    else
      Time.parse iso8601
    end
  end
end
