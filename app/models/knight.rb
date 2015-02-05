class Knight
  attr_accessor :color
  attr_accessor :type
  attr_accessor :starting_pos
  def initialize(color, type, starting_pos)
    @color = color
    @type = type
    @starting_pos = starting_pos
  end

  #E.g. transform the instance <Rook:0xb983ad9c @color=:white, @type=:rook, @starting_pos=:a1> 
  #in  :wRa1
  def notation
    color = @color.to_s
    type = @type.to_s
    starting_pos = @starting_pos.to_s
    abbr = color[0] + type[0].capitalize + starting_pos
    abbr.to_sym
  end
end