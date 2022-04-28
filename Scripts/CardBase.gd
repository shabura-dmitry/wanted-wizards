extends Node
var card_name:String
var card_desc:String
var card_picture:String
var card_sound:String
var damage:int
var reload:int
var type
var rarity:int
var cost:int


func _init(_type, _card_name, _card_picture,_card_sound,_damage, _reload,_rarity,_cost):
	card_name = _card_name
	card_picture = _card_picture
	damage = _damage
	card_sound = _card_sound
	reload = _reload
	type = _type
	rarity = _rarity
	cost = _cost
	pass

func get_card_rarity()->int:
	return rarity
func get_card_cost()->int:
	return cost
func set_card_cost(val:int)->void:
	cost = val
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
