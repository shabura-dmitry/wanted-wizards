extends Reference
class_name Character

var max_trinkets = 2
var character_name
var max_health
var health
var max_armor
var armor
var character_sprite
var trinkets:Array

func _init(_character_name, _max_health, _max_armor):
	character_name = _character_name
	
	max_health = _max_health
	max_armor = _max_armor
	
	health = max_health
	armor = max_armor
	trinkets = [Trinket.new(),Trinket.new()]
func set_trinket(slot:int, trinket:Trinket):
	if slot-1 > max_trinkets or slot-1 <0:
		return
	else:
		trinkets[slot-1] = trinket

func get_trinket(slot:int)->Trinket:
	if trinkets[slot]:
		return trinkets[slot]
	return null
	
func to_string():
	var s = character_name + ": \n"
	s += "Max Health: " + str(max_health) + " \n"
	s += "Max Armor: " + str(max_armor) + " \n\n"
	s += "Current Health: " + str(health) + " \n"
	s += "Current Armor: " + str(armor) + " \n\n"
	s += "Trinkets: \n"
	if range(trinkets.size()).has(0):
		s+= "Trinket 1:" + trinkets[0].to_string() + " \n"
	if range(trinkets.size()).has(1):
		s+="Trinket 2:" + trinkets[1].to_string()
	return s
