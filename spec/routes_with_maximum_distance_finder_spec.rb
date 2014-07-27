require 'spec_helper'

describe RoutesWithMaximumDistanceFinder do
  it 'finds three stop route between A add D' do
    graph = Graph.new('AB5,BC6,AC1,CD1,BD4,AD7')
    route_finder = RoutesWithMaximumDistanceFinder.new(graph)

    routes = route_finder.find('A', 'D', 8)

    expect(routes.size).to eq(2)
    expect(routes).to include({:route=> Route.new('A', 'C', 'D'), :distance => 2})
    expect(routes).to include({:route=> Route.new('A', 'D'), :distance => 7})
  end

  it 'does not find any routes with of less than 9  between A and E' do
    graph = Graph.new('AB5,BC6,AC1,CD1,BD4,AD7')
    route_finder = RoutesWithMaximumDistanceFinder.new(graph)

    expect{route_finder.find('A', 'E', 9)}.to raise_error NoSuchRouteException
  end
end
