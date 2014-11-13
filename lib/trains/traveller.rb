class Traveller
  def initialize(graph, route)
    @graph = graph
    @route = route
    @current_stop = 0
    @current_location = route.get_stop @current_stop
    @distance_travelled = 0
  end

  def travel
    if @route.next? @current_stop
      next_location = @route.get_stop @current_stop + 1

      begin
        local_route = @graph.route? @current_location, next_location
        @distance_travelled = @distance_travelled + local_route[:distance]
        @current_stop = @current_stop + 1
        @current_location = next_location
        travel
      rescue NoRoutesFoundException
        raise NoSuchRouteException
      end
    end

    {:distance => @distance_travelled}
  end
end
