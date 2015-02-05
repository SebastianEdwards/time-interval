module TimeInterval
  class TimeWithDuration
    UNITS = %w(years months weeks days hours minutes seconds).freeze

    def self.parse(iso8601)
      halves = iso8601.split('/')

      fail ArgumentError unless halves.length == 2

      if halves[0]['P']
        forwards = false
        duration = Duration.parse(halves[0])
        time = halves[1]
      elsif halves[1]['P']
        forwards = true
        duration = Duration.parse(halves[1])
        time = halves[0]
      else
        fail ArgumentError
      end

      new Time.parse(time), duration, forwards
    end

    attr_reader :start_time
    attr_reader :duration

    def initialize(time, duration, forwards = true)
      @start_time = time
      @duration = duration
      @forwards = forwards
    end

    def end_time
      if forwards?
        duration.add_to start_time
      else
        duration.subtract_from start_time
      end
    end

    def iso8601
      if forwards?
        "#{start_time.iso8601}/#{duration.iso8601}"
      else
        "#{duration.iso8601}/#{start_time.iso8601}"
      end
    end

    def step
      TimeWithDuration.new end_time, duration, forwards?
    end

    private

    def forwards?
      @forwards == true
    end
  end
end
