require "./spec_helper"
require "../src/day1"

Spectator.describe Day1 do
  subject(:day1) { described_class.new(input.lines) }

  let(:input) {
    <<-EOF
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
    EOF
  }

  describe "#max_calories" do
    it "#returns the highest number of calories carried by a single elf" do
      expect(day1.max_calories).to eq(24_000)
    end
  end

  describe "#calories_top_3" do
    it "returns the sum of the calories carried by the top three Elves carrying the most calories" do
      expect(day1.calories_top_3).to eq(45_000)
    end
  end
end
