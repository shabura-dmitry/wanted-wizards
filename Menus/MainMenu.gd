extends Control

func _ready():
	var map = MapGeneration.generate_map(2,2)
	print(map)
	
	
	
	
	


func _on_TextureButton_pressed():
	pass # Replace with function body.


func _on_StartButton_pressed():
	var battle_scene = load("res://Scenes/Battle.tscn").instance()
	get_tree().get_root().get_node("MainMenu").add_child(battle_scene)
	get_tree().get_root().get_node("MainMenu/MenuContainer").hide()


func _on_QuitButton_pressed():
	pass # Replace with function body.


func _on_OptionsButton_pressed():
	pass # Replace with function body.
