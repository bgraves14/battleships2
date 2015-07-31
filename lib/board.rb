require_relative "grid"
require_relative "ship"
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

	def check_coordinates(ship, coordinate, direction)
		direction == :horizontal ? matrix_reference = 0 : matrix_reference = 1
	end

	def place(ship, coordinate, direction)
		converted = convert_coordinates(coordinate)
		orientation = check_coordinates(ship, coordinate, direction)
		check_if_can_place( ship, converted, orientation)
		cells_to_ship(ship, converted, orientation)
	end

	def cells_to_ship(ship, converted, orientation)
		ship.size.times do
			grid.find_cell(converted).change_type(ship)
			converted[orientation] += 1
		end
	end
	def check_if_can_place(ship, converted, direction)
		if direction == :vertical
			fail "You cannot place ship outside grid" unless ship.size + converted[1] < @grid.area
		else 
			fail "You cannot place ship outside grid" unless ship.size + converted[0] < @grid.area
		end
	end
end
