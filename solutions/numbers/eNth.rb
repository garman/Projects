######################
# Brothers' Formulae #
######################
class Brothers
  require 'bigdecimal'

  def initialize(points)
    @points = points.to_i
  end

  def calculate_e
    (0..100).inject(0) do |r, e|
      r + numerator(e) / denominator(e)
    end.truncate(@points)
  end

  private

  def factorial_end(num)
    2 * num + 1
  end

  def numerator(num)
    (BigDecimal.new("2.0") * num + BigDecimal.new("2.0"))
  end

  def denominator(num)
    (1..factorial_end(num)).reduce(1, :*)
  end
end

puts Brothers.new(ARGV[0]).calculate_e
