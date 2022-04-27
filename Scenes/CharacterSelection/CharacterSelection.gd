extends Control

onready var character_slots = get_node("MarginContainer/HB")
var character_box = load("res://Scenes/CharacterSelection/Character Box.tscn")


func _ready():
	var slinger_box = character_box.instance()
	slinger_box.character_data = CharacterPresets.get_slinger()
	character_slots.add_child(slinger_box)
	
