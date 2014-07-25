require 'spec_helper'

describe Graph do
	it "can build a route between two towns" do
		graph = Graph.new("AB5")

		expect(graph.get_nodes.size).to eq(1)
		expect(graph.get_nodes["A"]).to eq([{:town => "B", :distance => 5}])
	end

	it "can build a two routes starting at the same town" do
		graph = Graph.new("AB5,AC4")

		expect(graph.get_nodes.size).to eq(1)
		expect(graph.get_nodes["A"]).to eq([{:town => "B", :distance => 5}, {:town => "C", :distance => 4}])

	end
end