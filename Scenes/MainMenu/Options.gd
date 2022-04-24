extends Control

var music_volume
var sound_volume


func _on_BackButton_pressed():
	get_tree().get_root().get_node("Game/CurrentScene/OptionsContainer").queue_free()
	get_tree().get_root().get_node("Game/CurrentScene").add_child(load("res://Scenes/MainMenu/MenuContainer.tscn").instance())
