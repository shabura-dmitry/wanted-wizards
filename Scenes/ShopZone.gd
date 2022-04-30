extends Control
class_name ShopZone
onready var shop_items = SavingLoading.zone_data["zone_q"][SavingLoading.zone_data["zone_prog"]].shop_items

#
#func _ready():
#	for item in shop_items:
#		$"New Cards".add_child(item)
#		item.get_node("Cost").show()
#		item.can_buy = true
#
		
		
func is_class(type): return type == "ShopZone" or .is_class(type)
func get_class(): return "ShopZone"



func _process(delta):
	if SavingLoading.game_data["party"][0].get_battle_timer_range().y < 0.25:
		$"New Cards/FireSpeed".hide()

func _on_BaseDmg_pressed():
	Upgrades.upgrade_base_damage(1)
	SavingLoading.game_data["party"][0].set_health(SavingLoading.game_data["party"][0].get_max_health())
	get_tree().get_root().get_node("Game").call_deferred("set_current_scene","res://Scenes/BattleScene.tscn")
	
	self.queue_free()



func _on_MaxHP_pressed():
	Upgrades.upgrade_max_health(SavingLoading.game_data["party"][0], 100)
	SavingLoading.game_data["party"][0].set_health(SavingLoading.game_data["party"][0].get_max_health())
	get_tree().get_root().get_node("Game").call_deferred("set_current_scene","res://Scenes/BattleScene.tscn")
	self.queue_free()



func _on_FireSpeed_pressed():
	Upgrades.upgrade_fire_speed(SavingLoading.game_data["party"][0],0.1)
	SavingLoading.game_data["party"][0].set_health(SavingLoading.game_data["party"][0].get_max_health())
	get_tree().get_root().get_node("Game").call_deferred("set_current_scene","res://Scenes/BattleScene.tscn")
	self.queue_free()

