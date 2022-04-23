extends Control

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
	add_child(character_scene)
	character_scene.position = Vector2(50,50)
	
	#update scene to match data
	character_scene.update_character_appearance()
	
	
func _on_TextureButton_pressed():
	pass # Replace with function body.


func _on_StartButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	pass # Replace with function body.


func _on_OptionsButton_pressed():
	pass # Replace with function body.
