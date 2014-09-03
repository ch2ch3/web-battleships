class FiringBoard

	attr_reader :dimensions
	attr_accessor :grid

	def initialize(x,y, placement_grid)
		@grid = Array.new(x) { Array.new(y) }
		@placement_grid = placement_grid
	end

	def linked_ship_board
		@placement_grid
	end

	def fire_at(coordinates)
    x = coordinates.first
    y = coordinates.last
		raise "You've already fired here!" if coordinate_fired_at?(x,y)
		@grid[x][y] = (linked_ship_board.hit_at?(x,y) ? :hit : :miss)
		self
	end

	def coordinate_fired_at?(x,y)
		not @grid[x][y].nil?
	end

	def status(coordinates)
    x = coordinates.first
    y = coordinates.last
		@grid[x][y]
	end

end
