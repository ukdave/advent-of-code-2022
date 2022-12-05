class Day1
  @elf_calories : Array(Int32)

  def initialize(lines : Array(String))
    @elf_calories = lines.chunks(&.empty?)
      .reject { |empty?, _| empty? }
      .map { |_, calories| calories.sum(&.to_i) }
  end

  def max_calories
    @elf_calories.max
  end
end
