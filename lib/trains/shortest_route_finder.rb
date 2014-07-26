class ShortestRouteFinder < RouteFinder
  def find(start_point, end_point)
    routes = super(start_point, end_point)

    length_of_shortest_route = 99999999
    shortest_route = nil
    routes.each do |route|
      traveller = Traveller.new @graph, route
      if traveller.travel[:distance] < length_of_shortest_route
        length_of_shortest_route = traveller.travel[:distance]
        shortest_route = route
      end
    end

    shortest_route
  end
end