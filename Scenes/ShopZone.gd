extends Control
class_name ShopZone
onready var shop_items = SavingLoading.zone_data["zone_q"][SavingLoading.zone_data["zone_prog"]].shop_items


func _ready():
	for item in shop_items:
		$"New Cards".add_child(item)
		item.get_node("Cost").show()
		item.can_buy = true
		
		
		
func is_class(type): return type == "ShopZone" or .is_class(type)
func get_class(): return "ShopZone"



func _process(delta):
	if $"New Cards".get_child_count() <3:
		get_tree().get_root().get_node("Game").call_deferred("set_current_scene","res://Scenes/BattleScene.tscn")
		queue_free()
