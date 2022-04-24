extends Node


func generate_map(levels:int,max_nodes_per_level:int)->Array:
	var map = [] #index in array represents level/height in map
	for i in range(0,levels):
		var level_nodes = []
		for n in range(0, max_nodes_per_level):
			var map_node = MapNode.new();
			level_nodes.append(map_node)
		map.append(level_nodes)
	return map
