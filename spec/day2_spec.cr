require "./spec_helper"
require "../src/day2"

Spectator.describe Day2 do
  subject(:day2) { described_class.new(input.lines) }

  let(:input) {
    <<-EOF
    A Y
    B X
    C Z
    EOF
  }

  describe "#score" do
    it "returns your score for the tournament" do
      expect(day2.score).to eq(15)
    end
  end
end

Spectator.describe Round do
  describe "#score" do
    context "with rock and paper" do
      subject(:round) { described_class.new("A", "B") }
      it "returns 8" do
        expect(round.score).to eq 8
      end
    end
    context "with paper and rock" do
      subject(:round) { described_class.new("B", "X") }
      it "returns 1" do
        expect(round.score).to eq 1
      end
    end
    context "with scissors and scissors" do
      subject(:round) { described_class.new("C", "Z") }
      it "returns 6" do
        expect(round.score).to eq 6
      end
    end
  end
end
