extends Node2D


func _ready():
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
	
	get_node("PlayerChars").add_child(character_scene)
	get_node("PlayerChars").add_child(character_scene)
	get_node("PlayerChars").add_child(character_scene)
	
	#update scene to match data
	character_scene.update_character_appearance()

