extends Node

var base_dmg:int = 0 setget set_base_dmg,get_base_dmg
var modifiers:Dictionary = {"FIRE":0}

func set_base_dmg(val:int)->void:
	base_dmg =val
func get_base_dmg()->int:
	return base_dmg
	
func get_modifiers()->Dictionary:
	return modifiers

#play the card
func execute()->void:
	pass
