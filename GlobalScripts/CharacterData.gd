extends Reference
class_name CharacterData
var is_enemy = false
var default_party_pos = 1 setget set_default_party_pos,get_default_party_pos
var current_party_pos = 1 setget set_current_party_pos,get_current_party_pos
var character_name setget set_character_name,get_character_name
var max_health:int setget set_max_health, get_max_health
var health:int setget set_health,get_health
var character_sprite:String setget set_sprite,get_sprite
var deck = [] setget set_deck,get_deck
var battle_timer_range = Vector2(2,5) setget set_battle_timer_range,get_battle_timer_range
var bounty:int = 0 setget set_bounty,get_bounty

func _init(name:String):
	character_name = name	
	

func set_is_enemy(val:bool)->void:
	is_enemy = val
func get_is_enemy()->bool:
	return is_enemy
func set_bounty(val:int)->void:
	bounty = val
func get_bounty()->int:
	return bounty
	
	
func set_battle_timer_range(_range:Vector2)->void:
	battle_timer_range = _range

func get_battle_timer_range()->Vector2:
	return battle_timer_range


func set_deck(_deck:Array)->void:
	deck = _deck
	
func get_deck()->Array:
	return deck
	
func add_to_deck(card):
	deck.append(card)
	
func remove_from_deck(card):
	deck.remove(deck.find(card))
	

		
func set_default_party_pos(val:int)->void:
	if val >=1:
		default_party_pos = val
		
func get_default_party_pos()->int:
	return default_party_pos
	
func set_current_party_pos(val:int)->void:
	if val >=1:
		current_party_pos = val
		
func get_current_party_pos()->int:
	return current_party_pos
	
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

func set_max_health(val:int)->void:
	if val >0:
		max_health = val
		
func get_max_health()->int:
	return max_health
	
func to_string():
	var s = character_name + ": \n"
	s += "Max Health: " + str(max_health) + " \n"
	s += "Current Health: " + str(health) + " \n"
	return s
	
func is_dead():
	return get_health() <=0
