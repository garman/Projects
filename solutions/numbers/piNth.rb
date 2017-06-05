############################
# Gauss-Legendre Algorithm #
############################
class GaussLegendre
  require 'bigdecimal'

  def initialize(points)
    @points = points.to_i
    @a      = BigDecimal.new("1.0")
    @b      = BigDecimal.new("#{1.0/Math.sqrt(2.0)}")
    @t      = BigDecimal.new("0.25")
    @p      = BigDecimal.new("1.0")
    @pi     = BigDecimal.new("0.0")
  end

  def calculate_pi
    500.times do
      calculate_next_series
      calculate_intermediate_pi
    end
    @pi.truncate(@points)
  end

  private

  def calculate_next_series
    an = (@a + @b) / 2
    bn = (Math.sqrt(@a * @b))
    tn = @t - @p * (@a - an)**2
    pn = 2 * @p

    @a = an
    @b = bn
    @t = tn
    @p = pn
  end

  def calculate_intermediate_pi
    @pi = (@a + @b)**2 / (4.0 * @t)
  end
end

puts GaussLegendre.new(ARGV[0]).calculate_pi
