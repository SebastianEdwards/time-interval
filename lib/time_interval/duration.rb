module TimeInterval
  class Duration
    def self.parse(duration_str)
      y = duration_str['Y'] ? duration_str.match(/(\d+)Y/)[1].to_i : 0
      m = duration_str['M'] ? duration_str.match(/(\d+)M/)[1].to_i : 0
      w = duration_str['W'] ? duration_str.match(/(\d+)W/)[1].to_i : 0
      d = duration_str['D'] ? duration_str.match(/(\d+)D/)[1].to_i : 0
      if duration_str['T']
        h = duration_str['H'] ? duration_str.match(/T.*(\d+)H/)[1].to_i : 0
        mi = duration_str['M'] ? duration_str.match(/T.*(\d+)M/)[1].to_i : 0
        s = duration_str['S'] ? duration_str.match(/T.*(\d+)S/)[1].to_i : 0
      else
        h = mi = s = 0
      end

      new(years: y, months: m, weeks: w, days: d, hours: h, minutes: mi,
      seconds: s)
    end

    attr_reader :years, :months, :weeks, :days, :hours, :minutes, :seconds

    def initialize(years: 0, months: 0, weeks: 0, days: 0, hours: 0, minutes: 0,
      seconds: 0)
      @years = years
      @months = months
      @weeks = weeks
      @days = days
      @hours = hours
      @minutes = minutes
      @seconds = seconds
    end

    def add_to(time)
      time + total_seconds
    end

    def iso8601
      string = 'P' + iso8601_date
      string += iso8601_time unless iso8601_time == 'T'

      string
    end

    def subtract_from(time)
      time - total_seconds
    end

    def present?
      total_seconds > 0
    end

    def total_seconds
      years.years + months.months + weeks.weeks + days.days + hours.hours +
        minutes.minutes + seconds.seconds
    end

    private

    def iso8601_date
      string = ''
      string += "#{years}Y" if years > 0
      string += "#{months}M" if months > 0
      string += "#{weeks}W" if weeks > 0
      string += "#{days}D" if days > 0

      string
    end

    def iso8601_time
      string = 'T'
      string += "#{hours}H" if hours > 0
      string += "#{minutes}M" if minutes > 0
      string += "#{seconds}S" if seconds > 0

      string
    end
  end
end
