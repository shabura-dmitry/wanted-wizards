extends Node
var CardBase = load("res://Scenes/Cards/CardBase.gd")
enum Cards {BasicShot,BasicSpell}


func generate_card(card):
	#if character
	match card:
		null:
			return CardBase.new("","","","",0)
			
		Cards.BasicShot:
			return CardBase.new("Basic Shot",
			 "Target Enemy",
			"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			"gun1",
			5)
			
		Cards.BasicSpell:
			return CardBase.new("Basic Spell",
			"Target Enemy",
			"res://Assets/Cards/Card_Pictures/manasprite.png",
			"spell1",
			40)
