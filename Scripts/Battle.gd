extends Node2D

onready var q1 = get_node("Fight/PlayerChars/Q1")
onready var q2 = get_node("Fight/PlayerChars/Q2")
onready var q3 = get_node("Fight/PlayerChars/Q3")

func _ready():
	load_chars()



func load_chars():
	#Get Character Object from Game Data
	for character in SavingLoading.game_data["party"]:
		#Create Character Scene
	
		var char_scene = load("res://Scenes/Character.tscn").instance()
		#Pass character object to scene
		char_scene.character_data = character
		
		#Add characters to queue
		match(character.get_default_party_pos()):
			1: 
				character.set_current_party_pos(1)
				q1.add_child(char_scene)
			2: 
				character.set_current_party_pos(2)
				q2.add_child(char_scene)
			3: 
				character.set_current_party_pos(3)
				q3.add_child(char_scene)
			
		char_scene.update_character_appearance()
			

func clear_q():
	for child in q1.get_children():
		child.queue_free()
	for child in q2.get_children():
		child.queue_free()
	for child in q3.get_children():
		child.queue_free()

func advance_turn():
	clear_q()
	for character in SavingLoading.game_data["party"]:
		character.set_current_party_pos((character.get_current_party_pos() % SavingLoading.game_data["party"].size())+1)
		var char_scene = new_char_scene(character)
		match(character.get_current_party_pos()):
			1: 
				q1.add_child(char_scene)
			2: 
				q2.add_child(char_scene)
			3: 
				q3.add_child(char_scene)
		char_scene.update_character_appearance()
			
		
func new_char_scene(character_data):
	#Create Character Scene
	var char_scene = load("res://Scenes/Character.tscn").instance()
	#Pass character object to scene
	char_scene.character_data = character_data
	return char_scene
