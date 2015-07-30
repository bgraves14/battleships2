require_relative "grid"

class Board
	attr_reader :ships, :grid
	def initialize
		@grid = Grid.new
	end

	def convert_coordinates(coords)
		x,y = coords.scan(/\d+|\D+/)
		[x.ord - 65,y.to_i - 1]
	end

	def display_grid
		grid.matrix.map{|row| row.map{|el| el.type.material} }
	end

	def place_ship(ship,coordinate,direction)
		converted = convert_coordinates(coordinate)
		cell = grid.find_cell(converted)
		cell.change_type(ship)
	end
end
