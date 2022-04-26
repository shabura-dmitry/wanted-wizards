extends Control

var character_data:CharacterData
#onready var name_label = get_node("VB/Character Name")
#onready var health_label = get_node("VB/Health Label")
#onready var armor_label = get_node("VB/Armor Label")
#onready var character_sprite = get_node("VB/Character Sprite")
#onready var trinket_one_sprite = get_node("VB/HB/Trinket Slot One/Trinket Sprite")
#onready var trinket_two_sprite = get_node("VB/HB/Trinket Slot Two/Trinket Sprite")

func _ready():
	pass
	
#func update_character_appearance():
	#name_label.text = str(character_data.get_character_name())
	#health_label.text = str(character_data.get_health())
	#armor_label.text = str(character_data.get_armor())
	#character_sprite.texture = load(character_data.get_sprite())
	#if character_data.get_trinket(1) != null:
	#	trinket_one_sprite = character_data.get_trinket(1)
	#if character_data.get_trinket(2) != null:
	#	trinket_two_sprite = character_data.get_trinket(2)

func take_damage(val:int)->void:
	character_data.set_health(character_data.get_health()-val)

func heal(val:int)->void:
	character_data.set_health(character_data.get_health()+val)

#func take_armor_damage(val:int)->void:
#	character_data.set_armor(character_data.get_health()-val)
#
#func heal_armor(val:int)->void:
#	character_data.set_armor(character_data.get_heath()+val)
