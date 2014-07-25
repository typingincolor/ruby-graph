require 'spec_helper'

describe Graph do
	it "can build a graph between two towns" do
		graph = Graph.new("AB5")

		expect(graph.get_nodes).not_to be_empty
		expect(graph.get_nodes["A"]).to eq([{:town => "B", :distance => 5}])
	end


end