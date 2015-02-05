module TimeInterval
  class TimePair
    def self.parse(iso8601)
      halves = iso8601.split('/')

      fail ArgumentError unless halves.length == 2

      start_time, end_time = halves.map { |time| Time.parse time }

      new start_time, end_time
    end

    attr_reader :start_time
    attr_reader :end_time

    def initialize(start_time, end_time)
      @start_time = start_time
      @end_time = end_time
    end

    def iso8601
      "#{start_time.iso8601}/#{end_time.iso8601}"
    end
  end
end
