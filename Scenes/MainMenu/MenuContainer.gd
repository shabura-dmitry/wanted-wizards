extends VBoxContainer

func _on_Start_pressed():
	#Go to Character Selection Screen
	get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/CharacterSelection/CharacterSelection.tscn")
	pass # Replace with function body.


func _on_Options_pressed():
	get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/MainMenu/Options.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	#Quit Game
	get_tree().quit()

