extends Node
#the filepath of the save file
var game_path = "res://game.save"
var game_data = {"party":[]}

func _ready():
	var char1 = CharacterData.new("CHAR 1")
	char1.set_default_party_pos(1);
	char1.set_sprite("res://Assets/CharacterPlaceholder.png")
	
	var char2 = CharacterData.new("CHAR 2")
	char2.set_default_party_pos(2)
	char2.set_sprite("res://Assets/CharacterPlaceholder.png")
	game_data["party"].append(char1)
	game_data["party"].append(char2)
	
	var char3 = CharacterData.new("CHAR 3")
	char3.set_default_party_pos(3)
	char3.set_sprite("res://Assets/CharacterPlaceholder.png")
	game_data["party"].append(char3)
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
