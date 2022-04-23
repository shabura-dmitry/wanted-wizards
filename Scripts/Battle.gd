extends Node2D


func _ready():
	load_char()
	load_char()
	load_char()


func load_char():
	#Create Character Object
	var character_data = CharacterData.new()
	#Populate object with data
	character_data.set_character_name("Whyld Whest")
	character_data.set_sprite("res://Assets/CharacterPlaceholder.png")
	
	#Create character scene
	var character_scene = load("res://Scenes/Character.tscn").instance()
	#Give scene the character data
	character_scene.character_data = character_data

	#add scene to project
	insert_char(character_scene, 1)
	
	#update scene to match data
	character_scene.update_character_appearance()



func insert_char(character_scene, pos):
	get_node("Fight/PlayerChars").add_child(character_scene)
	
	
	
	
#var char_q
#
#func _init(_char_q):
#	char_q = _char_q
#
#
#func cycle_chars(char_q):
#	for character in char_q: #for every object in this array
#		character.set_party_pos(character.get_party_pos() + 1 % char_q.size())
