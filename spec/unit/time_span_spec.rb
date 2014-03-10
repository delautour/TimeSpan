require 'spec_helper'
require 'time_span'

describe TimeSpan do

  describe ".dump" do
    it "returns the total seconds of the time span" do
      timespan = TimeSpan.new(17.5)
      expect(TimeSpan.dump(timespan)).to eq 17.5
    end
  end

  describe ".load" do
    it "should interpret string values as seconds" do
      expect(TimeSpan.load("15").total_seconds).to eq 15
    end

    it "should interpret numeric values as seconds" do
      expect(TimeSpan.load(15.5).total_seconds).to eq 15.5
    end

    it "should interpret string values as seconds" do
      timespan = TimeSpan.new(17.5)
      expect(TimeSpan.load(timespan).total_seconds).to eq 17.5
    end
  end

  describe "#-" do
    let(:left) { TimeSpan.new(60) }
    it "should subtract a timespan" do
      expect(left - TimeSpan.new(14.5)).to eq TimeSpan.new(60 - 14.5)
    end

    it "should subtract a number (as seconds)" do
      expect(left - 14.5).to eq TimeSpan.new(60 - 14.5)
    end

    it "should subtract a string (as seconds)" do
      expect(left - '14.5').to eq TimeSpan.new(60 - 14.5)
    end
  end

  describe "#+" do
    let(:left) { TimeSpan.new(60) }
    it "should add a timespan" do
      expect(left + TimeSpan.new(14.5)).to eq TimeSpan.new(60 + 14.5)
    end

    it "should add a number (as seconds)" do
      expect(left + 14.5).to eq TimeSpan.new(60 + 14.5)
    end

    it "should add a string (as seconds)" do
      expect(left + '14.5').to eq TimeSpan.new(60 + 14.5)
    end
  end

  describe "#/" do
    let(:left) { TimeSpan.new(60) }
    it "should divide a timespan" do
      expect(left / TimeSpan.new(14.5)).to eq TimeSpan.new(60 / 14.5)
    end

    it "should divide a number (as seconds)" do
      expect(left / 14.5).to eq TimeSpan.new(60 / 14.5)
    end

    it "should divide a string (as seconds)" do
      expect(left / '14.5').to eq TimeSpan.new(60 / 14.5)
    end
  end

  describe "#*" do
    let(:left) { TimeSpan.new(60) }
    it "should multiply a timespan" do
      expect(left * TimeSpan.new(14.5)).to eq TimeSpan.new(60 * 14.5)
    end

    it "should multiply a number (as seconds)" do
      expect(left * 14.5).to eq TimeSpan.new(60 * 14.5)
    end

    it "should multiply a string (as seconds)" do
      expect(left * '14.5').to eq TimeSpan.new(60 * 14.5)
    end
  end

  describe "#hours" do
    subject(:to_s) { time_span.hours }
    let(:time_span) { TimeSpan.new((3 * 3600) + (2 * 60) + 15) }

    it("returns the number of full hours in the timespan") do
      should eq 3
    end
  end

  describe "#minutes" do
    subject(:to_s) { time_span.minutes }
    let(:time_span) { TimeSpan.new((3 * 3600) + (2 * 60) + 15) }

    it("returns the number of full minuets in the timespan") do
      should eq 2
    end
  end

  describe "#seconds" do
    subject(:to_s) { time_span.seconds }
    let(:time_span) { TimeSpan.new((3 * 3600) + (2 * 60) + 15) }

    it("returns the number of full seconds in the timespan") do
      should eq 15
    end
  end

  describe "#total_hours" do
    subject(:to_s) { time_span.total_hours }
    let(:time_span) { TimeSpan.new(3600 * 2.5) }

    it("returns total duration the timespan in hours") do
      should eq 2.5
    end
  end

  describe "#total_minutes" do
    subject(:to_s) { time_span.total_minutes }
    let(:time_span) { TimeSpan.new(60 * 2.5) }

    it("returns total duration the timespan in minutes") do
      should eq 2.5
    end
  end

  describe "#total_seconds" do
    subject(:to_s) { time_span.total_seconds }
    let(:time_span) { TimeSpan.new(15.5) }

    it("returns total duration the timespan in seconds") do
      should eq 15.5
    end
  end

  describe "#to_s" do
    subject(:to_s) { time_span.to_s }
    let(:time_span) { TimeSpan.new((1* 3600) + (2 * 60) + 21) }

    it("breaks the duration in to components") do
      should eq "1:02:21"
    end
  end
end
