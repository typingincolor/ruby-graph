class Walker 
	def initialize(graph, route)
		@graph = graph
		@route = route
		@current_stop = 0
		@current_location = route.get_stop @current_stop
		@distance_travelled = 0
	end

	def walk
		if @route.has_next? @current_stop
			next_location = @route.get_stop @current_stop + 1
			
			begin
				local_route = @graph.is_there_a_route? @current_location, next_location
				@distance_travelled = @distance_travelled + local_route[:distance]
				@current_stop = @current_stop + 1
				@current_location = next_location
				walk
			rescue NoRoutesFoundException
				raise NoSuchRouteException
			end
		end	

		return {:distance => @distance_travelled}	
	end
end