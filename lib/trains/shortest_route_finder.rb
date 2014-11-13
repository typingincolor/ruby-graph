# ShortestRouteFinder
class ShortestRouteFinder < RouteFinder
  def find
    routes = super

    length_of_shortest_route = 99_999_999
    shortest_route = nil
    routes.each do |route|
      if route[:distance] < length_of_shortest_route
        length_of_shortest_route = route[:distance]
        shortest_route = route
      end
    end

    shortest_route
  end
end
