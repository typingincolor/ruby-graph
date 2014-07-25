require_relative("./invalid_route_exception")

class Route
	def initialize(graph, *towns)
		if towns.size < 2 || !(graph.is_a? Graph)
			raise InvalidRouteException
		end

		@graph = graph
		@towns = towns
		@town_index = -1
	end

	def next
		@town_index = @town_index + 1
		return @towns[@town_index]
	end

	def has_next?
		if @town_index < @towns.size - 1
			return true
		end

		return false	
	end
end