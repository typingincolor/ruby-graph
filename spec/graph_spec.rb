require 'spec_helper'

describe Graph do
	it 'can build a route between two towns' do
		graph = Graph.new('AB5')

		expect(graph.get_nodes.size).to eq(1)
		expect(graph.get_nodes['A']).to eq([{:town => 'B', :distance => 5}])
	end

	it 'can build two routes starting at the same town' do
		graph = Graph.new('AB5,AC4')

		expect(graph.get_nodes.size).to eq(1)
		expect(graph.get_nodes['A']).to eq([{:town => 'B', :distance => 5}, {:town => 'C', :distance => 4}])
	end

	it 'does not allow a duplicate route to be created' do
		expect {
			Graph.new('AB1,AB5')
		}.to raise_error(DuplicateRouteException)
	end

	it 'can build a graph with routes starting at two towns' do
		graph = Graph.new('AB5,AC4,CB6')

		expect(graph.get_nodes.size).to eq(2)
		expect(graph.get_nodes['A']).to eq([{:town => 'B', :distance => 5}, {:town => 'C', :distance => 4}])
		expect(graph.get_nodes['C']).to eq([{:town => 'B', :distance => 6}])
	end

	it 'can find routes starting at a valid town' do
		graph = Graph.new('AB5,AC4,CB6')

		expect(graph.get_routes_starting_at 'A').to eq([{:town => 'B', :distance => 5}, {:town => 'C', :distance => 4}])
	end

	it 'throws a NoRoutesFoundException when asking for routes starting at an invalid town' do
		graph = Graph.new('AB5,AC4,CB6')

		expect {
			graph.get_routes_starting_at 'D'
			}.to raise_error(NoRoutesFoundException)
	end

	it 'can find a route between two towns' do
		graph = Graph.new('AB5,AC4,CB6')

		route = graph.is_there_a_route?('A', 'B')

		expect(route).to eq({:town => 'B', :distance => 5})
	end

	it 'throws NoSuchRouteException when it tries to find a route between two towns and none exists' do
		graph = Graph.new('AB5,AC4,CB6,CD5')

		expect {
			graph.is_there_a_route?('A', 'D')
		}.to raise_error(NoSuchRouteException)
	end
end