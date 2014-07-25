require_relative("./invalid_route_exception")

class Route
	def initialize(graph, *towns)
		if towns.size < 2 || !(graph.is_a? Graph)
			raise InvalidRouteException
		end

		@graph = graph
		@towns = towns
	end
end