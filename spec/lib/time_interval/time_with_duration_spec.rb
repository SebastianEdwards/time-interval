RSpec.describe TimeWithDuration do
  describe '.parse' do
    context 'iso8601 is a valid time and duration' do
      let(:iso8601) { '2007-03-01T13:00:00Z/P1M' }

      it 'should create a TimeWithDuration' do
        result = TimeWithDuration.parse iso8601

        expect(result).to be_a TimeWithDuration
      end

      it 'should have correct start_time' do
        result = TimeWithDuration.parse iso8601

        expect(result.start_time).to eq DateTime.parse('2007-03-01T13:00:00Z')
      end

      it 'should have correct end_time' do
        result = TimeWithDuration.parse iso8601

        expect(result.end_time).to eq DateTime.parse('2007-04-01T13:00:00Z')
      end
    end
  end

  describe '#iso8601' do
    let(:time) { DateTime.parse('2007-03-01T13:00:00Z') }
    let(:duration) { Duration.new(months: 2) }
    let(:time_with_duration) { TimeWithDuration.new time, duration }

    it 'should return a valid iso8601 time with duration' do
      expect(time_with_duration.iso8601).to eq '2007-03-01T13:00:00Z/P2M'
    end
  end
end
