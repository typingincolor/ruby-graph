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
end