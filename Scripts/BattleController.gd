extends Control
const max_zones = 10
var zone_q =[]
onready var zone_prog_bar = get_node("ZoneProgress")
onready var zone_prog_path_pos = get_node("ZoneProgress/Path2D/PathFollow2D")
onready var zone_prog_indicator = get_node("ZoneProgress/ZoneProgIndicator")
onready var zone_prog =0

onready var party_container = get_node("M/C/M/Party")
onready var party_slots = party_container.get_children()
onready var party_data = SavingLoading.game_data["party"]
onready var PartyMemberScene = load("res://Scenes/Character.tscn")

onready var enemy_container = get_node("M/C2/M/Enemies")
onready var enemy_slots = enemy_container.get_children()


func _ready():
	zone_prog = 0
	zone_prog_path_pos.offset = zone_prog
	zone_prog_indicator.rect_position = zone_prog_path_pos.position
	for party_member in party_data:
		var scene = PartyMemberScene.instance()
		scene.character_data = party_member
		party_container.get_node("C"+str(party_member.get_default_party_pos())).add_child(scene)
		
	generate_zones()

	#print(zone_q)
	for enemy in zone_q[0].get_enemy_q():
		var enemy_data = enemy.character_data
		enemy_container.get_node("E" + str(enemy_data.get_default_party_pos())).add_child(enemy)
	#for zone in zone_q:
	#	if "Battle" in zone.name or "Boss" in zone.name:
	#		print(zone.name)
	#		print(zone.get_enemy_q())
			
	#for enemy in zone_q[0].get_enemy_q():
		#enemy_container.get_node("E"+str(enemy.get_default))
func generate_zones():
	zone_q = ZoneManager.get_zones(10);
	
func next_zone():
	$Shopplaceholder.hide()

	for slot in enemy_slots:
		if slot.get_child_count() >0:
			slot.get_child(0).queue_free()

		
	if zone_prog < max_zones-1:
		zone_prog +=1
		print(zone_prog)
		zone_prog_path_pos.offset = 44 * zone_prog
		zone_prog_indicator.rect_position = zone_prog_path_pos.position
		
		if zone_q[zone_prog].is_class("BattleZone"):
			for enemy in zone_q[zone_prog].get_enemy_q():
				var enemy_data = enemy.character_data

				enemy_container.get_node("E" + str(enemy_data.get_default_party_pos())).add_child(enemy)
		if zone_q[zone_prog].is_class("ShopZone"):
			$Shopplaceholder.show()
			print("TODO SHOPZONE!!!")


func _on_Button_pressed():
	next_zone()
