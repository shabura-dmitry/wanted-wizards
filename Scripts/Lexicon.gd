extends Node


var card = load("res://Scenes/Cards/CardTemplate.tscn")


func _ready():
	for slot in 16:
			load_card(slot)
	
func load_card(slot):
	var new_card = card.instance()
	get_node("Page").get_child(slot).add_child(new_card)
	
	
