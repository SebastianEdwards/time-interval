# TimeInterval

[![Build Status](https://travis-ci.org/SebastianEdwards/time-interval.svg?branch=master)](https://travis-ci.org/SebastianEdwards/time-interval)
[![Code Climate](https://codeclimate.com/github/SebastianEdwards/time-interval/badges/gpa.svg)](https://codeclimate.com/github/SebastianEdwards/time-interval)

#### Did you know that the ISO8601 defines time interval standards?

Find out all about it here: http://en.wikipedia.org/wiki/ISO_8601#Time_intervals

```ruby
# A one month period
interval = TimeInterval.parse "2007-03-01T00:00:00Z/P1M"
interval.start_time # => 2007-03-01 00:00:00 UTC
interval.end_time # => 2007-04-01 00:00:00 UTC

# A period defined by two time points
interval = TimeInterval.parse "2007-03-01T00:00:00Z/2007-09-01T00:00:00Z"
interval.start_time # => 2007-03-01 00:00:00 UTC
interval.end_time # => 2007-09-01 00:00:00 UTC

# A repeating five minute period
repeating_interval = TimeInterval.parse "R/2007-03-01T00:00:00Z/PT5M"
periods = repeating_interval.take(100) # => using take due to infinite nature of repeating interval
periods.last.start_time # => 2007-03-01 08:15:00 UTC
periods.last.end_time # => 2007-03-01 08:20:00 UTC

# A two week period repeated two times
repeating_interval = TimeInterval.parse "R2/2007-03-01T00:00:00Z/P2W"
periods = repeating_interval.to_a
periods.length # => 2
periods[0].start_time # => 2007-03-01 00:00:00 UTC
periods[0].end_time # => 2007-03-15 00:00:00 UTC
periods[1].start_time # => 2007-03-15 00:00:00 UTC
periods[1].end_time # => 2007-03-29 00:00:00 UTC
periods[2] # => nil
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time-interval'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time-interval

## Usage

`TimeInterval.parse(iso8601)` will parse ISO8601 string into a time, interval, or repeating interval.

`TimeInterval.repeating?(iso8601)` will check if ISO8601 string is a repeating interval.

`TimeInterval.interval?(iso8601)` will check if ISO8601 string is an interval.

## Contributing

1. Fork it ( https://github.com/SebastianEdwards/time-interval/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
