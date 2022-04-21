extends Reference
#the filepath of the save file
var game_path = "res://game.save"
var game_data:Dictionary = {}


func save_game()->void:
	var file = File.new()
	file.open(game_path, File.WRITE)
	file.store_pascal_string(var2str(game_data))
	file.close()

func load_game()->void:
	var file = File.new()
	file.open(game_path, File.Read)
	var new_game_data = str2var(file.get_pascal_string())
	file.close()
	game_data = new_game_data
