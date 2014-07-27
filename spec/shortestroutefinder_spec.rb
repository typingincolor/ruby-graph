require 'spec_helper'

describe ShortestRouteFinder do
  it 'finds shortest route between A and B' do
    graph = Graph.new('AB5,BC6,AC1')
    route_finder = ShortestRouteFinder.new(graph)

    route = route_finder.find('A', 'B')

    expect(route).to eq({:route => Route.new('A', 'B'), :distance => 5})
  end

  it 'handles non-existant route' do
    graph = Graph.new('AB5,BC6,AC1')
    route_finder = ShortestRouteFinder.new(graph)

    expect { route_finder.find('B', 'A') }.to raise_error NoSuchRouteException
  end
end