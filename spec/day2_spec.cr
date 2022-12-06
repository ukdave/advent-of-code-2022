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

  describe "#score_part1" do
    it "returns your score for the tournament when the second code is an item" do
      expect(day2.score_part1).to eq(15)
    end
  end

  describe "#score_part2" do
    it "returns your score for the tournament when the second code is an outcome" do
      expect(day2.score_part2).to eq(12)
    end
  end
end

Spectator.describe Round do
  describe "#score" do
    context "with rock and paper" do
      subject(:round) { described_class.new(Item::Rock, Item::Paper) }

      it "returns 8" do
        expect(round.score).to eq 8
      end
    end

    context "with paper and rock" do
      subject(:round) { described_class.new(Item::Paper, Item::Rock) }

      it "returns 1" do
        expect(round.score).to eq 1
      end
    end

    context "with scissors and scissors" do
      subject(:round) { described_class.new(Item::Scissors, Item::Scissors) }

      it "returns 6" do
        expect(round.score).to eq 6
      end
    end
  end

  describe "#initialize(item1 : Item, outcome : Outcome)" do
    context "with rock and draw" do
      subject(:round) { described_class.new(Item::Rock, Outcome::Draw) }

      it "chooses rock" do
        expect(round.item2).to eq Item::Rock
      end
    end

    context "with paper and loose" do
      subject(:round) { described_class.new(Item::Paper, Outcome::Loose) }

      it "chooses rock" do
        expect(round.item2).to eq Item::Rock
      end
    end

    context "with scissors and win" do
      subject(:round) { described_class.new(Item::Scissors, Outcome::Win) }

      it "chooses rock" do
        expect(round.item2).to eq Item::Rock
      end
    end

    context "with rock and win" do
      subject(:round) { described_class.new(Item::Rock, Outcome::Win) }

      it "chooses paper" do
        expect(round.item2).to eq Item::Paper
      end
    end
  end
end
