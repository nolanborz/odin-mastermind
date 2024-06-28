require_relative 'display.rb'
require_relative 'game.rb'
class Cpu
  
  include Display
  attr_accessor :name
  def initialize
    @name = 'Megatron'
    @@color_arr = ['red', 'orange', 'yellow', 'blue', 'green', 'purple', 'white', 'black']
  end
  
  def submit_color
    color = @@color_arr.shuffle.take(1)
    return color[0]
  end
      
end