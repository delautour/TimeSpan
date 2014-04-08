require 'spec_helper'
require 'time_span_serializer'

describe TimeSpanSerializer do
  let(:unit) { :seconds }
  let(:serializer) { TimeSpanSerializer.new(unit) }

  describe ".dump" do

    it "returns nil for nil" do
      expect(serializer.dump(nil)).to eq nil
    end

    context 'when created with seconds as the unit' do
      let(:unit) { :seconds }

      it "returns the total seconds of the time span" do
        timespan = TimeSpan.new(17.5, :seconds)
        expect(serializer.dump(timespan)).to eq 17.5
      end
    end

    context 'when created with minutes as the unit' do
      let(:unit) { :minutes }

      it "returns the total minutes of the time span" do
        timespan = TimeSpan.new(17.5, :minutes)
        expect(serializer.dump(timespan)).to eq 17.5
      end
    end

    context 'when created with hours as the unit' do
      let(:unit) { :hours }

      it "returns the total hours of the time span" do
        timespan = TimeSpan.new(17.5, :hours)
        expect(serializer.dump(timespan)).to eq 17.5
      end
    end

  end

  describe ".load" do
    it "returns nil for nil" do
      expect(serializer.load(nil)).to eq nil
    end

    context 'when created with seconds as the unit' do
      let(:unit) { :seconds }

      it "should interpret string values as seconds" do
        expect(serializer.load("15").total_seconds).to eq 15
      end

      it "should interpret numeric values as seconds" do
        expect(serializer.load(15.5).total_seconds).to eq 15.5
      end

      it "should interpret string values as seconds" do
        timespan = TimeSpan.new(17.5, :seconds)
        expect(serializer.load(timespan).total_seconds).to eq 17.5
      end
    end

    context 'when created with minutes as the unit' do
      let(:unit) { :minutes }

      it "should interpret string values as minutes" do
        expect(serializer.load("15").total_minutes).to eq 15
      end

      it "should interpret numeric values as minutes" do
        expect(serializer.load(15.5).total_minutes).to eq 15.5
      end

      it "should interpret string values as minutes" do
        timespan = TimeSpan.new(17.5, :minutes)
        expect(serializer.load(timespan).total_minutes).to eq 17.5
      end
    end


    context 'when created with hours as the unit' do
      let(:unit) { :hours }

      it "should interpret string values as hours" do
        expect(serializer.load("15").total_hours).to eq 15
      end

      it "should interpret numeric values as hours" do
        expect(serializer.load(15.5).total_hours).to eq 15.5
      end

      it "should interpret string values as hours" do
        timespan = TimeSpan.new(17.5, :hours)
        expect(serializer.load(timespan).total_hours).to eq 17.5
      end
    end
  end
end
