extends Control

func _ready():
	get_node("CurrentScene").add_child(load("res://Scenes/MainMenu/MenuContainer.tscn").instance())


func free_current_scene():
	get_node("CurrentScene").get_child(0).queue_free()

func set_current_scene(scene:String)->void:
	free_current_scene()
	get_node("CurrentScene").add_child(load(scene).instance())
