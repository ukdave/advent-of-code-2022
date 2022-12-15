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

  describe "#num_full_overlaps" do
    it "returns the number of full overlaps" do
      expect(day4.num_full_overlaps).to eq 2
    end
  end

  describe "#num_partial_overlaps" do
    it "returns the number of partial overlaps" do
      expect(day4.num_partial_overlaps).to eq 4
    end
  end
end
