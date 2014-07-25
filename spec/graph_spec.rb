require 'spec_helper'

describe Graph do
	it "can build a route between two towns" do
		graph = Graph.new("AB5")

		expect(graph.get_nodes.size).to eq(1)
		expect(graph.get_nodes["A"]).to eq([{:town => "B", :distance => 5}])
	end

	it "can build two routes starting at the same town" do
		graph = Graph.new("AB5,AC4")

		expect(graph.get_nodes.size).to eq(1)
		expect(graph.get_nodes["A"]).to eq([{:town => "B", :distance => 5}, {:town => "C", :distance => 4}])
	end

	it "does not allow a duplicate route to be created" do
		expect {
			Graph.new("AB1,AB5")
		}.to raise_error(DuplicateRoute)
	end

	it "can build a graph with routes starting at two towns" do
		graph = Graph.new("AB5,AC4,CB6")

		expect(graph.get_nodes.size).to eq(2)
		expect(graph.get_nodes["A"]).to eq([{:town => "B", :distance => 5}, {:town => "C", :distance => 4}])
		expect(graph.get_nodes["C"]).to eq([{:town => "B", :distance => 6}])
	end
end