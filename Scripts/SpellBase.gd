extends Node
class_name SpellBase
var spell_name:String
var spell_desc:String
var spell_picture:String
var spell_sound:String
var damage:int
var reload:int
var type



func _init(_type, _spell_name, _spell_picture,_spell_sound,_damage, _reload):
	spell_name = _spell_name
	spell_picture = _spell_picture
	damage = _damage
	spell_sound = _spell_sound
	reload = _reload
	type = _type

	pass

func get_card_picture()->String:
	return spell_picture
func get_card_desc()->String:
	return spell_desc
func get_card_name()->String:
	return spell_name
func get_damage():
	return damage
func get_card_sound():
	return spell_sound
func get_reload_time():
	return reload
func get_card_type():
	return type
