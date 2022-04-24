extends Control

onready var music_volume = get_node("MusicContainer/MusicSlider")
onready var sound_volume = get_node("SoundContainer/SoundSlider")
onready var m_label = get_node("MusicContainer/Music Volume Label")
onready var s_label = get_node("SoundContainer/Sound Volume Label")

func _ready():
	print(str(SavingLoading.settings["music_volume"]))
	music_volume.value = SavingLoading.settings["music_volume"]
	sound_volume.value = SavingLoading.settings["sound_volume"]
	
	m_label.text = "Music Volume:" + str(SavingLoading.settings["music_volume"])
	s_label.text = "Sound Volume:" + str(SavingLoading.settings["sound_volume"])
func _on_BackButton_pressed():
	get_tree().get_root().get_node("Game/CurrentScene/OptionsContainer").queue_free()
	get_tree().get_root().get_node("Game/CurrentScene").add_child(load("res://Scenes/MainMenu/MenuContainer.tscn").instance())


func _on_MusicSlider_value_changed(value):
	SavingLoading.settings["music_volume"] = value
	m_label.text = "Music Volume:" + str(SavingLoading.settings["music_volume"])


func _on_SoundSlider_value_changed(value):
	SavingLoading.settings["sound_volume"] = value
	s_label.text = "Sound Volume:" + str(SavingLoading.settings["sound_volume"])
