extends Node
#the filepath of the save file
var game_path = "res://game.save"
var game_data = {"party":[], "bounty_collected":0, "full_deck" : [], "total_killed":0}
var zone_data = {"zone_prog":-1, "zone_q": []}
var settings ={"music_volume":100, "sound_volume":100}
var played_splash = false


		
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
