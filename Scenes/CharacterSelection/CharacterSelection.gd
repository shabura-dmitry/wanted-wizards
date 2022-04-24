extends Control

onready var character_slots = get_node("MarginContainer/HB")
var character_box = load("res://Scenes/CharacterSelection/Character Box.tscn")

func _ready():
	generate_basic_characters()
	
	
func generate_basic_characters():
	var slinger_box = character_box.instance()
	var slinger_char = CharacterData.new("Gun Slinger")
	slinger_char.set_base_damage(5)
	slinger_char.set_max_armor(1)
	slinger_char.set_max_health(5)
	slinger_char.set_armor(slinger_char.get_max_armor())
	slinger_char.set_health(slinger_char.get_max_health())
	slinger_char.set_default_party_pos(3)
	slinger_char.set_current_party_pos(3)
	slinger_char.set_sprite("res://Assets/Cowboy.png")
	
	slinger_box.character_data = slinger_char
	#new_char_box.update()
	
	character_slots.add_child(slinger_box)
	#i HAVE to call .update after adding child, or it will crash
	slinger_box.update()
	
	
	var knight_box = character_box.instance()
	var knight_char = CharacterData.new("Knight")
	knight_char.set_base_damage(2)
	knight_char.set_max_armor(10)
	knight_char.set_max_health(8)
	knight_char.set_armor(knight_char.get_max_armor())
	knight_char.set_health(knight_char.get_max_health())
	knight_char.set_default_party_pos(3)
	knight_char.set_current_party_pos(3)
	knight_char.set_sprite("res://Assets/Bandit2.png")
	
	knight_box.character_data = knight_char
	#new_char_box.update()
	
	character_slots.add_child(knight_box)
	#i HAVE to call .update after adding child, or it will crash
	knight_box.update()
	
	
	var assassin_box = character_box.instance()
	var assassin_char = CharacterData.new("Assassin")
	assassin_char.set_base_damage(8)
	assassin_char.set_max_armor(0)
	assassin_char.set_max_health(2)
	assassin_char.set_armor(assassin_char.get_max_armor())
	assassin_char.set_health(assassin_char.get_max_health())
	assassin_char.set_default_party_pos(3)
	assassin_char.set_current_party_pos(3)
	assassin_char.set_sprite("res://Assets/Bandit3.png")
	
	assassin_box.character_data = assassin_char
	#new_char_box.update()
	
	character_slots.add_child(assassin_box)
	#i HAVE to call .update after adding child, or it will crash
	assassin_box.update()
	
	var wizard_box = character_box.instance()
	var wizard_char = CharacterData.new("Wizard")
	wizard_char.set_base_damage(1)
	wizard_char.set_max_armor(0)
	wizard_char.set_max_health(3)
	wizard_char.set_armor(wizard_char.get_max_armor())
	wizard_char.set_health(wizard_char.get_max_health())
	wizard_char.set_default_party_pos(3)
	wizard_char.set_current_party_pos(3)
	wizard_char.set_max_mana(4)
	wizard_char.set_mana(wizard_char.get_max_mana())
	wizard_char.set_sprite("res://Assets/Bandit3.png")
	
	wizard_box.character_data = wizard_char
	#new_char_box.update()
	
	character_slots.add_child(wizard_box)
	#i HAVE to call .update after adding child, or it will crash
	wizard_box.update()
	
	
	
