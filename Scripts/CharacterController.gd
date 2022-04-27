extends Control

onready var character_data:CharacterData
var target
onready var battle_timer = get_node("BattleTimer")
onready var battle_timer_range = character_data.get_battle_timer_range()
onready var char_name = get_node("Name")
onready var health = get_node("Health")
onready var sprite = get_node("Character Sprite")
onready var rng = RandomNumberGenerator.new()
var LPC = load("res://Scenes/LastPlayedCard.tscn")
onready var last_played_card_holder = get_node("Control/LPC")
var last_played_card = CardManager.generate_card(CardManager.Cards.BasicSpell)


func _ready():
	#last_played_card = CardManager.generate_card(true,null)
	sprite.texture = load(character_data.get_sprite())
	health.max_value = character_data.get_max_health()
	health.min_value = 0
	
	battle_timer.max_value = character_data.get_battle_timer_range().y
	battle_timer.min_value= 0
	
	battle_timer.value=  0
	
func _process(delta):
	#battle_timer.value += delta
	_update(delta)
	
func play_card():
	var deck = character_data.get_deck()
	var random_card = deck[randi() % deck.size()]
	last_played_card = random_card
	target.take_damage(last_played_card.get_damage())
	
func _update(delta):
	battle_timer.value += delta
	if battle_timer.value >= battle_timer.max_value:
		if target != null:
			if !target.character_data.is_dead():
				play_card()
				battle_timer.value = 0
				rng.randomize()
				battle_timer.max_value = rng.randf_range(battle_timer_range.x,battle_timer_range.y)
				var lpc =LPC.instance()
				last_played_card_holder.add_child(lpc)
				lpc.show_value(last_played_card.get_card_name(),Vector2(0,-80),2,PI/2)
				
				SoundManager.play_se(last_played_card.get_card_sound())
		else:
			pass
	
	char_name.text = character_data.get_character_name()
	health.value = character_data.get_health()

	
func take_damage(val:int)->void:
	character_data.set_health(character_data.get_health()-val)
	update()

func heal(val:int)->void:
	character_data.set_health(character_data.get_health()+val)
	update()

