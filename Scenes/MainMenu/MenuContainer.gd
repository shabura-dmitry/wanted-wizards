extends Control

func _ready():
	if SavingLoading.played_splash:
		$SplashScreen.hide()
		
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
func fade():
	$Tween.interpolate_property($SplashScreen, "modulate:a",
	1.0,0.0,2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_all_completed")
	$SplashScreen.queue_free()
	$Timer.queue_free()
	SavingLoading.played_splash = true
	

func _on_Timer_timeout():
	if SavingLoading.played_splash == false:
		fade()

