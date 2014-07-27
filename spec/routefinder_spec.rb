require 'spec_helper'

describe RouteFinder do
  it 'finds two route between A and B' do
    graph = Graph.new('AB5,AC4,CB3')
    route_finder = RouteFinder.new(graph)

    routes = route_finder.find('A', 'B')

    expect(routes.size).to eq(2)
    expect(routes).to include(Route.new 'A', 'B')
    expect(routes).to include(Route.new 'A', 'C', 'B')
  end

  it 'handles non-existant route' do
    graph = Graph.new('AB5,BC6,AC1')
    route_finder = RouteFinder.new(graph)

    expect{route_finder.find('B', 'A')}.to raise_error NoSuchRouteException
  end

  it 'makes at least one step' do
    graph = Graph.new(('AB5,BA5'))
    route_finder = RouteFinder.new(graph)

    routes = route_finder.find('A', 'A')
    expect(routes.size).to eq(1)
    expect(routes).to include(Route.new 'A', 'B', 'A')
  end
end