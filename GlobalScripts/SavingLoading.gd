extends Node
#the filepath of the save file
var game_path = "res://game.save"
var game_data = {"party":[], "bounty_collected":0}
var zone_data = {"current_zone":0,
				0:{"bounty":1,"waves":1, "quota":1},
				1:{"bounty":1,"waves":2, "quota":2},
				2:{"bounty":2,"waves":2, "quota":4},
				3:{"bounty":2,"waves":3, "quota":6},
				4:{"bounty":3,"waves":3, "quota":9},
}
var settings ={"music_volume":100, "sound_volume":100}

		
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
