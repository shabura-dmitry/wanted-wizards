extends Node
var card_name
var card_desc
var card_picture
var card_sound
var damage
var reload
var type


func _init(_type, _card_name, _card_picture,_card_sound,_damage, _reload):
	card_name = _card_name
	card_picture = _card_picture
	damage = _damage
	card_sound = _card_sound
	reload = _reload
	type = _type
	pass

func get_card_picture()->String:
	return card_picture
func get_card_desc()->String:
	return card_desc
func get_card_name()->String:
	return card_name
func get_damage():
	return damage
func get_card_sound():
	return card_sound
func get_reload_time():
	return reload
func get_card_type():
	return type
