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

	def check_coordinates(ship, index, direction)
		direction == :horizontal ? matrix_reference = 0 : matrix_reference = 1
	end

	def place_ship(ship, coordinate, direction)
		converted = convert_coordinates(coordinate)
		orientation = check_coordinates(ship, coordinate, direction)
		cells_to_ship(ship, converted, orientation)
	end

	def cells_to_ship(ship, converted, orientation)
		ship.size.times do
			grid.find_cell(converted).change_type(ship)
			converted[orientation] += 1
		end
	end
end
