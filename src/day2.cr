class Day2
  @rounds : Array(Round)

  def initialize(lines)
    @rounds = lines.map { |line|
      moves = line.split(" ", 2)
      Round.new(moves.first, moves.last)
    }
  end

  def score
    @rounds.sum(&.score)
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

class Round
  ITEM_CODES = {
    "A" => Item::Rock,
    "B" => Item::Paper,
    "C" => Item::Scissors,
    "X" => Item::Rock,
    "Y" => Item::Paper,
    "Z" => Item::Scissors,
  }

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

  @item1 : Item
  @item2 : Item

  def initialize(item1 : String, item2 : String)
    @item1 = ITEM_CODES[item1]
    @item2 = ITEM_CODES[item2]
  end

  def score
    @item2.value + outcome.value
  end

  def outcome
    OUTCOME_MAP[@item1][@item2]
  end
end
