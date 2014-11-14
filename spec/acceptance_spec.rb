require 'spec_helper'

describe 'acceptance tests' do
  it 'passes test case 1' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    route = Route.new('A', 'B', 'C')
    traveller = Traveller.new(graph, route)

    expect(traveller.travel).to eq(distance: 9)
  end

  it 'passes test case 2' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    route = Route.new('A', 'D')
    traveller = Traveller.new(graph, route)

    expect(traveller.travel).to eq(distance: 5)
  end

  it 'passes test case 3' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    route = Route.new('A', 'D', 'C')
    traveller = Traveller.new(graph, route)

    expect(traveller.travel).to eq(distance: 13)
  end

  it 'passes test case 4' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    route = Route.new('A', 'E', 'B', 'C', 'D')
    traveller = Traveller.new(graph, route)

    expect(traveller.travel).to eq(distance: 22)
  end

  it 'passes test case 5' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    route = Route.new('A', 'E', 'D')
    traveller = Traveller.new(graph, route)

    expect { traveller.travel }.to raise_error(NoSuchRouteException)
  end

  it 'passes test case 6' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder1 = RoutesWithSpecificNumberOfStopsFinder.new graph, 'C', 'C', 3
    finder2 = RoutesWithSpecificNumberOfStopsFinder.new graph, 'C', 'C', 2

    result = finder1.find.concat finder2.find

    expect(result.size).to eq(2)

    expected = [
      Route.new('C', 'D', 'C'),
      Route.new('C', 'E', 'B', 'C')
    ]

    expect(result).to match_array(expected)
  end

  it 'passes test case 7' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = RoutesWithSpecificNumberOfStopsFinder.new graph, 'A', 'C', 4

    result = finder.find
    expect(result.size).to eq(3)

    expected = [
      Route.new('A', 'B', 'C', 'D', 'C'),
      Route.new('A', 'D', 'C', 'D', 'C'),
      Route.new('A', 'D', 'E', 'B', 'C')
    ]

    expect(result).to match_array(expected)
  end

  it 'passes test case 8' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = ShortestRouteFinder.new graph, 'A', 'C'
    route = finder.find
    expect(route).to eq(route: Route.new('A', 'B', 'C'), distance: 9)
  end

  it 'passes test case 9' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = ShortestRouteFinder.new graph, 'B', 'B'
    route = finder.find

    expect(route).to eq(route: Route.new('B', 'C', 'E', 'B'), distance: 9)
  end

  it 'passes test case 10' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = RoutesWithMaximumDistanceFinder.new graph, 'C', 'C', 30
    routes = finder.find

    expect(routes.size).to eq(7)

    expected = [
      { route: Route.new('C', 'D', 'C'), distance: 16 },
      { route: Route.new('C', 'E', 'B', 'C'), distance: 9 },
      { route: Route.new('C', 'E', 'B', 'C', 'D', 'C'), distance: 25 },
      { route: Route.new('C', 'D', 'C', 'E', 'B', 'C'), distance: 25 },
      { route: Route.new('C', 'D', 'E', 'B', 'C'), distance: 21 },
      { route: Route.new('C', 'E', 'B', 'C', 'E', 'B', 'C'), distance: 18 },
      { route: Route.new('C', 'E', 'B', 'C', 'E', 'B', 'C', 'E', 'B', 'C'),
        distance: 27 }
    ]

    expect(routes).to match_array(expected)
  end
end
