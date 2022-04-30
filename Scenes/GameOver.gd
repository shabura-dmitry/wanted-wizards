extends Control


func _on_TextureButton_pressed():
	get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/MainMenu/MenuContainer.tscn")
