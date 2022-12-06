class Day2
  @round_codes : Array(Array(String))

  def initialize(lines : Array(String))
    @round_codes = lines.map(&.split(" ", 2))
  end

  def score_part1
    rounds = @round_codes.map { |codes|
      Round.new(ITEM_CODES[codes.first], ITEM_CODES[codes.last])
    }
    rounds.sum(&.score)
  end

  def score_part2
    rounds = @round_codes.map { |codes|
      Round.new(ITEM_CODES[codes.first], OUTCOME_CODES[codes.last])
    }
    rounds.sum(&.score)
  end
end

enum Item
  Rock     = 1
  Paper    = 2
  Scissors = 3
end

enum Outcome
  Loose = 0
  Draw  = 3
  Win   = 6
end

ITEM_CODES = {
  "A" => Item::Rock,
  "B" => Item::Paper,
  "C" => Item::Scissors,
  "X" => Item::Rock,
  "Y" => Item::Paper,
  "Z" => Item::Scissors,
}

OUTCOME_CODES = {
  "X" => Outcome::Loose,
  "Y" => Outcome::Draw,
  "Z" => Outcome::Win,
}

class Round
  OUTCOME_MAP = {
    Item::Rock => {
      Item::Rock     => Outcome::Draw,
      Item::Paper    => Outcome::Win,
      Item::Scissors => Outcome::Loose,
    },
    Item::Paper => {
      Item::Rock     => Outcome::Loose,
      Item::Paper    => Outcome::Draw,
      Item::Scissors => Outcome::Win,
    },
    Item::Scissors => {
      Item::Rock     => Outcome::Win,
      Item::Paper    => Outcome::Loose,
      Item::Scissors => Outcome::Draw,
    },
  }

  getter item2

  def initialize(item1 : Item, item2 : Item)
    @item1 = item1
    @item2 = item2
  end

  def initialize(item1 : Item, outcome : Outcome)
    @item1 = item1
    @item2 = OUTCOME_MAP[item1].key_for(outcome)
  end

  def score
    @item2.value + outcome.value
  end

  def outcome
    OUTCOME_MAP[@item1][@item2]
  end
end
