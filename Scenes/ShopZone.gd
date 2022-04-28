extends Control
class_name ShopZone
var shop_items
onready var shop = get_node("Panel/New Cards")

func _ready():
	shop_items = [CardManager.generate_card(CardManager.Cards.BasicShot)]
	for item in shop_items:
		var card_template = load("res://Scenes/Cards/CardTemplate.tscn").instance()
		card_template.card = item
		shop.add_child(card_template)


func is_class(type): return type == "ShopZone" or .is_class(type)
func get_class(): return "ShopZone"

