extends VBoxContainer


func _on_StartButton_pressed():
#	go to character select		
	get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/CharacterSelection/CharacterSelection.tscn")
#	var battle_scene = load("res://Scenes/Battle.tscn").instance()
#	get_tree().get_root().get_node("MainMenu").add_child(battle_scene)
#	get_tree().get_root().get_node("MainMenu/MenuContainer").hide()
	pass


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_OptionsButton_pressed():
	get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/MainMenu/Options.tscn")
	
	#GO to options menu, which will have a button to go back to main menu (this scene)
