#http://edais.mvps.org/Tutorials/TTTAI/TTTg1.html
class Player
  attr_reader :symbol, :name

  def initialize(symbol, name)
    @symbol = symbol
    @name = name
  end
end