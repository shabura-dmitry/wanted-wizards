extends Control

onready var character_slots = get_node("MarginContainer/HB")
var character_box = load("res://Scenes/CharacterSelection/Character Box.tscn")


func _ready():
	var slinger_box = character_box.instance()
	slinger_box.character_data = CharacterPresets.get_slinger()
	character_slots.add_child(slinger_box)
	
	var knight_box = character_box.instance()
	knight_box.character_data = CharacterPresets.get_knight()
	character_slots.add_child(knight_box)
	
	var sorcerer_box = character_box.instance()
	sorcerer_box.character_data = CharacterPresets.get_sorcerer()
	character_slots.add_child(sorcerer_box)
