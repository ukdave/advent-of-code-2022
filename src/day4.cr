class Day4
  @range_pairs : Array(Array(Range(Int32, Int32)))

  def initialize(lines : Array(String))
    @range_pairs = lines.map do |line|
      line.split(",").map { |range_str| parse_range(range_str) }
    end
  end

  def num_overlaps
    @range_pairs.count do |pair|
      range_covers?(pair.first, pair.last) || range_covers?(pair.last, pair.first)
    end
  end

  private def parse_range(str)
    first, last = str.split("-").map(&.to_i)
    (first..last)
  end

  private def range_covers?(range1, range2)
    range1.includes?(range2.begin) && range1.includes?(range2.end)
  end
end
