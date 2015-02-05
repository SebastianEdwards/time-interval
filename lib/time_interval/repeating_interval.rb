module TimeInterval
  class RepeatingInterval
    def self.parse(iso8601)
      recurrence, time_with_duration_string = iso8601.split('/', 2)

      times = if recurrence.match(/^R(\d+)/)
                Regexp.last_match[1].to_i
              else
                Float::INFINITY
              end

      fail ArgumentError if times == 0

      new TimeWithDuration.parse(time_with_duration_string), times
    end

    include Enumerable

    attr_reader :length

    def initialize(time_with_duration, times)
      @time_with_duration = time_with_duration
      @length = times

      @enumerator = Enumerator::Lazy.new(0...times) do |yielder, i|
        if i == 0
          yielder.yield time_with_duration
        else
          interval = time_with_duration
          i.times { interval = interval.step }
          yielder.yield interval
        end
      end
    end

    def each(&block)
      @enumerator.each(&block)
    end

    def iso8601
      if length == Float::INFINITY
        "R/#{@time_with_duration.iso8601}"
      else
        "R#{length}/#{@time_with_duration.iso8601}"
      end
    end
  end
end
