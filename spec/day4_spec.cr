require "./spec_helper"
require "../src/day4"

Spectator.describe Day4 do
  subject(:day4) { described_class.new(input.lines) }

  let(:input) {
    <<-EOF
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    EOF
  }

  describe "#num_overlaps" do
    it "returns the number of overlaps" do
      expect(day4.num_overlaps).to eq 2
    end
  end
end
