extends Control

onready var character_data:CharacterData
var deck
onready var battle_timer = get_node("BattleTimer")
onready var battle_timer_range = character_data.get_battle_timer_range()
onready var char_name = get_node("Health/Name")
onready var health = get_node("Health")
onready var sprite = get_node("Character Sprite")
onready var rng = RandomNumberGenerator.new()
var LPC = load("res://Scenes/LastPlayedCard.tscn")
onready var last_played_card_holder = get_node("Control/LPC")
onready var unique_mat = $"Character Sprite".material.duplicate()
var last_played_card
var can_fight



signal card_played


func _ready():
	init_character()



func _process(delta):
	_update(delta)
	update_appearance()
	
	
	
func _update(delta):
	battle_timer.value += delta
	if battle_timer.value >= battle_timer.max_value:
		battle_timer.value = 0
		var data = {"origin":self,"target":null, "card_played":null}
		set_card_played(data)
		set_target(data)
		emit_signal("card_played", data)

				

func set_target(data):
	if data["card_played"].get_card_type() == CardManager.CardTypes.Heal:
		data["target"] = "self"
	elif character_data.get_is_enemy():
		data["target"] = "character"
	else:
		data["target"] = "enemy"
		
		
func set_card_played(data):
	data["card_played"] = get_random_card()
	
func play_card_effect():
	var lpc =LPC.instance()
	last_played_card_holder.add_child(lpc)
	#value,color,travel,duration,spread
	lpc.show_value(last_played_card, 
	CardManager.get_type_color(last_played_card.get_card_type()),
	Vector2(0,-80),
	2,
	PI/2)
	
func take_damage(damage):
	character_data.set_health(character_data.get_health() - damage)


func play_hit_effect(card_type):
	var color = get_effect_color(card_type)
	get_node("Character Sprite").material.set_shader_param("color",color)
	get_node("Effects").play("hitflash")
	
func set_can_fight(status):
	can_fight = status

func get_random_card():
	var random_card = deck[randi() % deck.size()]
	last_played_card = random_card
	return last_played_card

func get_effect_color(type):
	var color = CardManager.get_type_color(type)
	var c_to_3 = Vector3(color.r,color.g,color.b)
	return c_to_3

func update_appearance():
	char_name.text = character_data.get_character_name()
	health.value = character_data.get_health()

func init_character():
	can_fight = false
	last_played_card = CardManager.generate_card(CardManager.Cards.BasicShot)
	$"Character Sprite".material = unique_mat
	sprite.texture = load(character_data.get_sprite())
	health.max_value = character_data.get_max_health()
	health.min_value = 0
	
	char_name.text = character_data.get_character_name()
	health.value = character_data.get_health()
	
	battle_timer.max_value = character_data.get_battle_timer_range().y
	battle_timer.min_value = 0
	battle_timer.value = 0
	
	deck = character_data.get_deck()
