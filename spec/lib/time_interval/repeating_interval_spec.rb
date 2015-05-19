RSpec.describe RepeatingInterval do
  describe '.parse' do
    let(:iso8601) { 'R2/2007-03-01T13:00:00Z/P1M' }

    it 'should create a RepeatingInterval' do
      result = RepeatingInterval.parse iso8601

      expect(result).to be_a RepeatingInterval
    end

    context 'iso8601 has a set number of repetitions' do
      it 'should have correct length' do
        result = RepeatingInterval.parse iso8601

        expect(result.length).to eq 2
      end

      it 'should enumerate over the repetitions' do
        result = RepeatingInterval.parse iso8601

        expect(result.first).to be_a TimeWithDuration
      end

      it 'should have correct repetitions' do
        repeating = RepeatingInterval.parse(iso8601)
        repetitions = repeating.take(3)

        expect(repetitions[0].start_time).to eq '2007-03-01T13:00:00Z'
        expect(repetitions[1].start_time).to eq '2007-04-01T13:00:00Z'
        expect(repetitions[2]).to eq nil
      end
    end
  end

  describe '#iso8601' do
    let(:time) { DateTime.parse('2007-03-01T13:00:00Z') }
    let(:duration) { Duration.new(months: 2) }
    let(:time_with_duration) { TimeWithDuration.new time, duration }

    let(:repeating_interval) { RepeatingInterval.new time_with_duration, 4 }

    it 'should return a valid iso8601 time with duration' do
      expect(repeating_interval.iso8601).to eq 'R4/2007-03-01T13:00:00Z/P2M'
    end
  end
end
