extends Control
var battle_end = load("res://Scenes/BattleEnd.tscn")
onready var zone = SavingLoading.zone_data[0]
onready var party = SavingLoading.game_data["party"]
onready var quota = get_node("QuotaBar")
onready var bounty_label = get_node("Bounty")
var bounty
var e_killed
var p_lost
var enemy_q = []
var party_q = []


func _ready():
	e_killed =0
	p_lost = 0
	bounty = 1
	quota.value =0
	quota.max_value = zone.quota
	spawn_characters()
	spawn_enemy()
	pass

	
func spawn_characters():
	
	for p in range(0,party.size()):
		var p_scene = load("res://Scenes/Character.tscn").instance()
		p_scene.character_data = party[p]
		party_q.append(p_scene)
		get_node("Fight/PlayerChars").add_child(p_scene)

		



	
func spawn_enemy():
	for x in range(0,zone["waves"]):
		var e_scene = load("res://Scenes/Character.tscn").instance()
		e_scene.character_data = CharacterPresets.get_wizard()
		e_scene.target = party_q[party_q.size()-1]
		enemy_q.append(e_scene)
	
	for p in range(0,party_q.size()):
		party_q[p].target = enemy_q[0]
	for e in range(0,enemy_q.size()):
		enemy_q[e].target = party_q[party_q.size()-1]

	for e in enemy_q:
		get_node("Fight/EnemyChars").add_child(e)
	
func _process(delta):
	bounty_label.text = "Bounty:   $" + str(bounty)
	if party_q.size() >0:
		if party_q[party_q.size()-1].character_data.is_dead():
			
			var children = get_node("Fight/PlayerChars").get_children()
			get_node("Fight/PlayerChars").get_child(children.size()-1).free()
			party_q.pop_back()
			p_lost+=1
			if party_q.size() >0:
				for e in enemy_q:
					e.target = party_q[0]
			else:
				for e in enemy_q:
					e.target = null
	else:
		pass
	if enemy_q.size() >0:
		if enemy_q[0].character_data.is_dead():
			enemy_q.pop_front()
			get_node("Fight/EnemyChars").get_child(0).free()
			e_killed+=1
			quota.value = e_killed
			bounty *= 1.1
			
			if enemy_q.size()>0:
				for p in party_q:
					p.target = enemy_q[0]
			else:
				for p in party_q:
					p.target = null
	else:
		if e_killed != zone["quota"]:
			spawn_enemy()
		else:
			stop_battle()

func stop_battle():
	var overlay = battle_end.instance()
	overlay.zone = zone
	overlay.gold = 10
	overlay.killed = e_killed
	overlay.lost = p_lost
	add_child(overlay)
