require_relative("./invalid_route_exception")
require_relative("./end_of_route_exception")

class Route
	def initialize(graph, *towns)
		if towns.size < 2 || !(graph.is_a? Graph)
			raise InvalidRouteException
		end

		begin
			graph.get_routes_starting_at towns[0] 
		rescue NoRoutesFoundException
			raise InvalidRouteException
		end	

		@graph = graph
		@towns = towns
		@town_index = 0
		@total_distance = -1
	end

	def next
		if (!has_next?)
			raise EndOfRouteException
		end

		@town_index = @town_index + 1
		return @towns[@town_index]
	end

	def has_next?
		if @town_index < @towns.size - 1
			return true
		end

		return false	
	end

	def walk
		@total_distance = 0

		do_walk
	end

	def do_walk
		begin
			@total_distance = @total_distance + @graph.distance(@towns[@town_index], self.next())
			do_walk
		rescue EndOfRouteException
			return
		end
	end

	def get_distance
		if @total_distance == -1
			self.walk
		end

		return @total_distance
	end
end