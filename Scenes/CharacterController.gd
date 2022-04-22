extends Node2D

var character_data:CharacterData

func take_damage(val:int)->void:
	character_data.set_health(character_data.get_health-val)

func heal(val:int)->void:
	character_data.set_health(character_data.get_health+val)

func take_armor_damage(val:int)->void:
	character_data.set_armor(character_data.get_health-val)
	
func heal_armor(val:int)->void:
	character_data.set_armor(character_data.get_heath+val)
