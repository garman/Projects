##################################
# Binet's Formula & Golden Ratio #
##################################
class Binet
  PHI = 1.6180339887498948482045868

  def initialize(nth)
    @nth = nth
  end

  def calculate
    (PHI**@nth - (1 - PHI)**@nth)/Math.sqrt(5)
  end
end

puts Binet.new(ARGV[0].to_i).calculate.truncate

