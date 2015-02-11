RSpec.describe Duration do
  describe '.parse' do
    it 'should parse time-only durations correctly' do
      duration = Duration.parse 'PT2H25M'

      expect(duration.months).to eq 0
      expect(duration.hours).to eq 2
      expect(duration.minutes).to eq 25
    end

    it 'should parse date-only durations correctly' do
      duration = Duration.parse 'P1Y2M'

      expect(duration.years).to eq 1
      expect(duration.months).to eq 2
      expect(duration.minutes).to eq 0
    end

    it 'should parse mixed durations correctly' do
      duration = Duration.parse 'P1Y2MT2H25M'

      expect(duration.years).to eq 1
      expect(duration.months).to eq 2
      expect(duration.hours).to eq 2
      expect(duration.minutes).to eq 25
    end
  end
end
