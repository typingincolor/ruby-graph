class Graph
	@nodes = {}
	
	def initialize(graph)
		lines = graph.split(",")

		lines.each do |x|
			@nodes[x[0]] 
		end
	end

	def add_line(line)
		startPoint = line[0]
		endPoint = line[1]
		distance = line[2]

		@nodes[startPoint] = [] unless @nodes[startPoint]

		@nodes[startPoint] << {:town => endPoint, :distance => distance}
	end
end