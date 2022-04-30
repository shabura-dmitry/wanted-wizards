extends Control
const max_zones = 10
var zone_q =SavingLoading.zone_data["zone_q"]
onready var zone_prog_bar = get_node("ZoneProgress")
onready var zone_prog_path_pos = get_node("ZoneProgress/Path2D/PathFollow2D")
onready var zone_prog_indicator = get_node("ZoneProgress/ZoneProgIndicator")
onready var zone_prog = SavingLoading.zone_data["zone_prog"]

onready var party_container = get_node("M/C/M/Party")
onready var party_slots = party_container.get_children()
onready var party_data = SavingLoading.game_data["party"]
onready var PartyMemberScene = load("res://Scenes/Character.tscn")

onready var enemy_container = get_node("M/C2/M/Enemies")
onready var enemy_slots = enemy_container.get_children()
var next_zoneded

func _ready():
	
	#print(zone_prog)
	spawn_party()
	for p in party_data:
		p.set_deck(SavingLoading.game_data["full_deck"])
	zone_prog_path_pos.offset = 44 * zone_prog
	zone_prog_indicator.rect_position = zone_prog_path_pos.position
	if zone_prog == -1:
		generate_zones()
	next_zone()

func generate_zones():
	zone_q = ZoneManager.get_zones(max_zones)
	SavingLoading.zone_data["zone_q"] = zone_q
	
	

func _process(delta):
	var closest_enemy
	for s in range(0, enemy_slots.size()):
		if enemy_slots[s].get_child_count() >0:
			closest_enemy= enemy_slots[s].get_child(0)
	if !closest_enemy and !next_zoneded:
		next_zoneded = true
		next_zone()
		
	if  !closest_enemy and zone_prog >= 9:
		SavingLoading.zone_data["zone_prog"] = -1
		zone_prog = SavingLoading.zone_data["zone_prog"]
		generate_zones()
		zone_prog_path_pos.offset = 44 * zone_prog
		zone_prog_indicator.rect_position = zone_prog_path_pos.position
		next_zone()

		
		
func next_zone():

	
	if zone_prog < max_zones-1:
		zone_prog +=1
		print(zone_prog)
		SavingLoading.zone_data["zone_prog"] = zone_prog
		zone_prog_path_pos.offset = 44 * zone_prog
		zone_prog_indicator.rect_position = zone_prog_path_pos.position
		
		if zone_q[zone_prog].is_class("BattleZone"):
			print("battle")
			spawn_enemies()
			next_zoneded = false
			for p in party_slots:
				if p.get_child_count() >0:
					p.get_child(0).set_can_fight(true)
					p.show()
			
			
		if zone_q[zone_prog].is_class("ShopZone"):
			print("shop")
			SavingLoading.zone_data["zone_prog"] = zone_prog
			get_tree().get_root().get_node("Game").call_deferred("set_current_scene","res://Scenes/ShopZone.tscn")
			queue_free()
			#for p in party_slots:
			#	if p.get_child_count() >0:
			#		p.get_child(0).set_can_fight(false)
			#		p.hide()
			
			#$ShopZone.show()
			#$ShopZone.add_child(zone_q[zone_prog].get_shop_scene())
			#$ShopZone/H/C3.add_child(zone_q[zone_prog].shop_items[0])

			#shop_zone.shop_items = [CardManager.generate_card(CardManager.Cards.SelfShot)]
		#	add_child(shop_zone)

func spawn_party():
		## populate party member slots
	for party_member in party_data:
		var p_scene = PartyMemberScene.instance()
		p_scene.character_data = party_member
		party_container.get_node("C"+str(party_member.get_default_party_pos())).add_child(p_scene)
		
	party_slots = party_container.get_children()
	
	#connect party member signals
	for slot in party_slots:
		if slot.get_child_count() >0:
			if !slot.get_child(0).is_connected("card_played", self, "_on_card_played"):
				slot.get_child(0).connect("card_played", self, "_on_card_played")
				
	

func spawn_enemies():
		#populate enemy slots
	for enemy in zone_q[zone_prog].get_enemy_q():
		var e_data = enemy.character_data
		enemy_container.get_node("E"+str(e_data.get_default_party_pos())).add_child(enemy)
		
	enemy_slots = enemy_container.get_children()
	
	#connect enemy singals
	
	for slot in enemy_slots:
		if slot.get_child_count() >0:
			if !slot.get_child(0).is_connected("card_played", self, "_on_card_played"):
				slot.get_child(0).connect("card_played", self, "_on_card_played")


func _on_card_played(data):
	if data["origin"].can_fight:
		data["origin"].play_card_effect()
		AudioManager.play("res://Assets/Sounds/"+data["card_played"].get_card_sound()+".wav")
		var played_card_type = data["card_played"].get_card_type()
		var origin = data["origin"]
		var card_damage = data["card_played"].get_damage()

		match data["target"]:
			"self":
				pass
				origin.play_hit_effect(played_card_type)
			"enemy":
				if data["origin"].can_fight:
					if attack_enemy(played_card_type,card_damage) == -1 and zone_q[zone_prog].is_class("BattleZone"):
							var closest_enemy
							for s in range(0, enemy_slots.size()):
								if enemy_slots[s].get_child_count() >0:
									closest_enemy= enemy_slots[s].get_child(0)
								if  !closest_enemy and zone_prog >= 9:
									SavingLoading.zone_data["zone_prog"] = -1
									zone_prog = SavingLoading.zone_data["zone_prog"]
									generate_zones()
									zone_prog_path_pos.offset = 44 * zone_prog
									zone_prog_indicator.rect_position = zone_prog_path_pos.position
									call_deferred("next_zone")

func attack_enemy(played_card_type, card_damage):
	var closest_enemy
	for s in range(0, enemy_slots.size()):
		if enemy_slots[s].get_child_count() >0:
			closest_enemy= enemy_slots[s].get_child(0)
	if closest_enemy:
		closest_enemy.play_hit_effect(played_card_type)
		closest_enemy.take_damage(card_damage)
		if closest_enemy.character_data.is_dead():

			closest_enemy.queue_free()
			
			

			
			
	else:
		return -1
		
func _on_Button_pressed():
	for e in enemy_slots:
		if e.get_child_count() >0:
			e.get_child(0).queue_free()
	call_deferred("next_zone")
