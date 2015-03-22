RSpec.describe TimeInterval do
  describe '.parse' do
    context 'iso8601 is a valid time and duration' do
      let(:iso8601) { '2007-03-01T13:00:00Z/P1M' }

      it 'should return a TimeWithDuration' do
        expect(TimeInterval.parse(iso8601)).to be_a TimeWithDuration
      end
    end

    context 'iso8601 is a valid time pair' do
      let(:iso8601) { '2007-03-01T13:00:00Z/2008-05-11T15:30:00Z' }

      it 'should return a TimePair' do
        expect(TimeInterval.parse(iso8601)).to be_a TimePair
      end
    end

    context 'iso8601 is a valid repeating interval' do
      let(:iso8601) { 'R/2007-03-01T13:00:00Z/P1M' }

      it 'should return a RepeatingInterval' do
        expect(TimeInterval.parse(iso8601)).to be_a RepeatingInterval
      end
    end

    context 'iso8601 is not an interval' do
      let(:iso8601) { '2007-03-01T13:00:00Z' }

      it 'should return a TimePair with no duration' do
        parsed = TimeInterval.parse(iso8601)

        expect(parsed).to be_a TimePair
        expect(parsed.start_time).to eq parsed.end_time
      end
    end
  end
end
