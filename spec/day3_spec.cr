require "./spec_helper"
require "../src/day3"

Spectator.describe Day3 do
  subject(:day3) { described_class.new(input.lines) }

  let(:input) {
    <<-EOF
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    EOF
  }

  describe "#sum_priorities" do
    it "returns the sum of the priorities of the item types that appears in both compartments of each rucksack" do
      expect(day3.sum_priorities).to eq 157
    end
  end
end
