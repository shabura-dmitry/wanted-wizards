extends Control

func _ready():
	var character = Character.new("Bull E. Tshuter", 10,2);
	var new_trinket = Trinket.new()
	new_trinket.set_trinket_name("TEST")
	character.set_trinket(1, new_trinket)
	print(character.to_string())
func _on_TextureButton_pressed():
	pass # Replace with function body.


func _on_StartButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	pass # Replace with function body.


func _on_OptionsButton_pressed():
	pass # Replace with function body.
