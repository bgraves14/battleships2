require_relative "cell"

class Grid

  AREA = 10

  attr_accessor :matrix, :area
  
  def initialize
    @area = AREA
    @matrix = matrix_builder(AREA)
  end

  def matrix_builder(size)
    Array.new(size){Array.new(size) {Cell.new}}
  end

  def find_cell(coordinate)
    @matrix[coordinate[1]][coordinate[0]]
  end

end
