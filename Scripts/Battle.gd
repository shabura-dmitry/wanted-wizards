extends Control
onready var battle_timer_label = get_node("BattleTimerLabel")
onready var start_time = OS.get_ticks_msec()
onready var party = SavingLoading.game_data["party"]


func _ready():
	if party.size() >1:
		party.sort_custom(self,"sort_party")
		party.invert()
		
	for p in party:
		print(p.get_default_party_pos())
		
		
	place_party()

func sort_party(a,b):
	if typeof(a) == typeof(b):
		return a.get_default_party_pos() < b.get_default_party_pos()
	
func place_party():
	for character in party:
		var char_scene = load("res://Scenes/Character.tscn").instance()
		char_scene.character_data = character
		var pos_label = Label.new()
		pos_label.text = str(character.get_current_party_pos())
		char_scene.add_child(pos_label)
		get_node("Fight/PlayerChars").add_child(char_scene)
	pass
	#for x in range(0, party.size()):
	#	print(x+1)
	#for character in SavingLoading.game_data["party"]:
	#	match character.get_default_party_pos
		



func _process(delta):
	battle_timer_label.value += delta
	if battle_timer_label.value >= battle_timer_label.max_value:
		print("Bang!")
		battle_timer_label.value = 0
		
		
		
