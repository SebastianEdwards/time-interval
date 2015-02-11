module TimeInterval
  class Duration
    def self.parse(duration_str)
      if duration_str['PT']
        date_str = nil
        time_str = duration_str
      else
        date_str, time_str = duration_str.split('T')
      end

      if date_str
        y = date_str['Y'] ? date_str.match(/(\d+)Y/)[1].to_i : 0
        m = date_str['M'] ? date_str.match(/(\d+)M/)[1].to_i : 0
        w = date_str['W'] ? date_str.match(/(\d+)W/)[1].to_i : 0
        d = date_str['D'] ? date_str.match(/(\d+)D/)[1].to_i : 0
      else
        y = m = w = d = 0
      end

      if time_str
        h = time_str['H'] ? time_str.match(/(\d+)H/)[1].to_i : 0
        mi = time_str['M'] ? time_str.match(/(\d+)M/)[1].to_i : 0
        s = time_str['S'] ? time_str.match(/(\d+)S/)[1].to_i : 0
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
