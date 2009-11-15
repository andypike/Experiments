class Square
  attr_accessor :x, :y, :score

  def initialize(x, y)
    @x = x
    @y = y
    @score = 0
  end

  def to_s
    return "(#{@x}, #{@y}) => #{@score}"
  end
end