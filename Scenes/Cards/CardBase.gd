extends Node
var card_name
var card_desc
var card_picture
var dmg_types = []

func _init(_card_name, _card_desc, _card_picture, _dmg_types):
	card_name = _card_name
	card_desc = _card_desc
	card_picture = _card_picture
	dmg_types = _dmg_types
	pass

func get_dmg_types()->Array:
	return dmg_types
func get_card_picture()->String:
	return card_picture
func get_card_desc()->String:
	return card_desc
func get_card_name()->String:
	return card_name
