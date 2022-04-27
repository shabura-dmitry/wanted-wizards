extends Control
var killed =0
var gold
var lost
var zone

func _ready():
	if killed < zone["quota"]:
		get_node("ZoneStatus").text = "Zone Lost :("
	else:
		get_node("ZoneStatus").text = "Zone Cleared!!"
	get_node("Killed").text = "Enemies Killed:"+str(killed)
	get_node("Gold").text = "Gold Found:" + str(gold)
	get_node("Lost").text = "Partners Lost:" + str(lost)



func _on_Back_pressed():
	if SavingLoading.zone_data.has(SavingLoading.zone_data["current_zone"] +1):
		SavingLoading.zone_data["current_zone"] = SavingLoading.zone_data["current_zone"] +1
		get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/Battle.tscn")
		
	else:
		print("You Won!!!!")
