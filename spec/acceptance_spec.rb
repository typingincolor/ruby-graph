require 'spec_helper'

describe 'acceptance tests' do
	it 'passes test case 1' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
		route = Route.new('A', 'B', 'C')
		traveller = Traveller.new(graph, route)

		expect(traveller.travel).to eq({:distance => 9})
	end

	it 'passes test case 2' do
		graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
		route = Route.new('A', 'D')
    traveller = Traveller.new(graph, route)

		expect(traveller.travel).to eq({:distance => 5})
	end

	it 'passes test case 3' do
		graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
		route = Route.new('A', 'D', 'C')
    traveller = Traveller.new(graph, route)

		expect(traveller.travel).to eq({:distance => 13})
	end

	it 'passes test case 4' do
		graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
		route = Route.new('A', 'E', 'B', 'C', 'D')
    traveller = Traveller.new(graph, route)

		expect(traveller.travel).to eq({:distance => 22})
	end

	it 'passes test case 5' do
		graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
		route = Route.new('A', 'E', 'D')
    traveller = Traveller.new(graph, route)

		expect{traveller.travel}.to raise_error(NoSuchRouteException)
  end

  it 'passes test case 6' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = RoutesWithSpecificNumberOfStopsFinder.new graph

    result = finder.find('C', 'C', 3).concat finder.find('C','C', 2)

    expect(result.size).to eq(2)
    expect(result).to include Route.new 'C', 'D', 'C'
    expect(result).to include Route.new 'C', 'E', 'B', 'C'
  end

  it 'passes test case 7' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = RoutesWithSpecificNumberOfStopsFinder.new graph

    result = finder.find('A', 'C', 4)
    expect(result.size).to eq(3)
    expect(result).to include Route.new 'A', 'B', 'C', 'D', 'C'
    expect(result).to include Route.new 'A', 'D', 'C', 'D', 'C'
    expect(result).to include Route.new 'A', 'D', 'E', 'B', 'C'
  end

  it 'passes test case 8' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = ShortestRouteFinder.new graph
    route = finder.find('A', 'C')
    expect(route).to eq({:route => Route.new('A', 'B', 'C'), :distance => 9})
  end

  it 'passes test case 9' do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = ShortestRouteFinder.new graph
    route = finder.find('B', 'B')
    expect(route).to eq({:route => Route.new('B', 'C', 'E', 'B'), :distance => 9})
  end

  it 'passes test case 10'do
    graph = Graph.new('AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7')
    finder = RoutesWithMaximumDistanceFinder.new graph
    routes = finder.find('C', 'C', 30)

    expect(routes.size).to eq(7)
    expect(routes).to include ({:route => Route.new('C', 'D', 'C'), :distance => 16 })
    expect(routes).to include ({:route => Route.new('C', 'E', 'B', 'C'), :distance => 9 })
    expect(routes).to include ({:route => Route.new('C', 'E', 'B', 'C', 'D', 'C'), :distance => 25 })
    expect(routes).to include ({:route => Route.new('C', 'D', 'C', 'E', 'B', 'C'), :distance => 25 })
    expect(routes).to include ({:route => Route.new('C', 'D', 'E', 'B', 'C'), :distance => 21 })
    expect(routes).to include ({:route => Route.new('C', 'E', 'B', 'C', 'E', 'B','C'), :distance => 18 })
    expect(routes).to include ({:route => Route.new('C', 'E', 'B', 'C', 'E', 'B', 'C', 'E', 'B', 'C'), :distance => 27 })
  end
end
