extends Node
var CardBase = load("res://Scenes/Cards/CardBase.gd")
enum Cards {BasicShot}



func generate_card(card):
	match card:
		Cards.BasicShot:
			return CardBase.new("Basic Shot",
			 "Target Enemy",
			"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			5)

