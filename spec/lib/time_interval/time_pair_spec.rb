RSpec.describe TimePair do
  describe '.parse' do
    context 'iso8601 is a valid time pair' do
      let(:iso8601) { '2007-03-01T13:00:00Z/2008-05-11T15:30:00Z' }

      it 'should create a TimePair' do
        result = TimePair.parse iso8601

        expect(result).to be_a TimePair
      end

      it 'should have correct start_time' do
        result = TimePair.parse iso8601

        expect(result.start_time).to eq Time.parse('2007-03-01T13:00:00Z')
      end

      it 'should have correct end_time' do
        result = TimePair.parse iso8601

        expect(result.end_time).to eq Time.parse('2008-05-11T15:30:00Z')
      end
    end
  end

  describe '#iso8601' do
    let(:first_time) { Time.parse('2007-03-01T13:00:00Z') }
    let(:last_time) { Time.parse('2008-05-11T15:30:00Z') }
    let(:time_pair) { TimePair.new first_time, last_time }

    it 'should return a valid iso8601 time pair' do
      expected = '2007-03-01T13:00:00Z/2008-05-11T15:30:00Z'

      expect(time_pair.iso8601).to eq expected
    end
  end
end
