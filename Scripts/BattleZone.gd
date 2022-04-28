extends Node
class_name BattleZone
onready var zone_name = "" setget set_zone_name, get_zone_name
onready var enemy_q = [] setget set_enemy_q, get_enemy_q



func set_zone_name(val:String)->void:
	zone_name = val
func get_zone_name()->String:
	return zone_name
	
	
func set_enemy_q(q:Array)->void:
	enemy_q = q
func get_enemy_q()->Array:
	return enemy_q

func is_class(type): return type == "BattleZone" or .is_class(type)
func get_class(): return "BattleZone"
