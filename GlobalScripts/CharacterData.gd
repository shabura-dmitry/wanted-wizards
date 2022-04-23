extends Reference
class_name CharacterData

var max_trinkets = 2
var character_name setget set_character_name,get_character_name
var max_health =10
var health = 10  setget set_health,get_health
var max_armor =10
var armor =10 setget set_armor,get_armor
var character_sprite:String setget set_sprite,get_sprite
var trinkets:Dictionary ={ 1: {}, 2:{}}


#
#func _init(_character_name, _max_health, _max_armor):
#	character_name = _character_name
#
#	max_health = _max_health
#	max_armor = _max_armor
#
#	health = max_health
#	armor = max_armor
#	trinkets = [Trinket.new(),Trinket.new()]
	
func set_sprite(path:String)->void:
	if path.length()>0:
		character_sprite = path
		
func get_sprite()->String:
	return character_sprite

func set_character_name(val:String)->void:
	if val.length() >0:
		character_name = val
		
func get_character_name()->String:
	return character_name
	
func set_health(new_health:int)->void:
	if new_health > max_health:
		health = max_health
	elif new_health <0:
		health = 0
	else:
		health = new_health

func get_health()->int:
	return health
	
func set_armor(new_armor:int)->void:
	if new_armor>max_armor:
		armor = max_armor
	elif new_armor <0 :
		armor = 0
	else:
		armor = new_armor

func get_armor()->int:
	return armor
		
	
func set_trinket(slot:int, trinket:Trinket):
	if slot in range(1, max_trinkets):
		trinkets[slot] = trinket

func get_trinket(slot:int)->Trinket:
	if trinkets[slot]:
		return trinkets[slot]
	return null
	
func can_target()->bool:
	return true
func to_string():
	var s = character_name + ": \n"
	s += "Max Health: " + str(max_health) + " \n"
	s += "Max Armor: " + str(max_armor) + " \n\n"
	s += "Current Health: " + str(health) + " \n"
	s += "Current Armor: " + str(armor) + " \n\n"
	s += "Trinkets: \n"
	s += str(trinkets)
	#if range(trinkets.size()).has(0):
	#	s+= "Trinket 1:" + trinkets[0].to_string() + " \n"
	#if range(trinkets.size()).has(1):
	#	s+="Trinket 2:" + trinkets[1].to_string()
	return s
