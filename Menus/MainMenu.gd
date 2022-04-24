extends Control

func _ready():
	get_node("CurrentScene").add_child(load("res://Scenes/MainMenu/MenuContainer.tscn").instance())


