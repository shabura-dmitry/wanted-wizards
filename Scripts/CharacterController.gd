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
	var unique_mat = $"Character Sprite".material.duplicate()
	$"Character Sprite".material = unique_mat
	
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
	if last_played_card.get_card_type() == CardManager.CardTypes.Attack:
		var color = CardManager.get_type_color(CardManager.CardTypes.Attack)
		var color_to_vec3 = Vector3(color.r,color.g,color.b)
		
		target.get_node("Character Sprite").material.set_shader_param("color",color_to_vec3)
		target.get_node("Effects").play("hitflash")
	
		target.take_damage(last_played_card.get_damage())
	elif last_played_card.get_card_type() == CardManager.CardTypes.Heal:
		var color = CardManager.get_type_color(CardManager.CardTypes.Heal)
		var color_to_vec3 = Vector3(color.r,color.g,color.b)
		
		get_node("Character Sprite").material.set_shader_param("color",color_to_vec3)
		get_node("Effects").play("hitflash")
		heal(last_played_card.get_damage())
	
func _update(delta):
	battle_timer.value += delta
	if battle_timer.value >= battle_timer.max_value:
		if target != null:
			if !target.character_data.is_dead():
				play_card()
				battle_timer.value = 0
				rng.randomize()
				
				battle_timer.max_value = rng.randf_range(battle_timer_range.x + last_played_card.get_reload_time()
				,battle_timer_range.y + last_played_card.get_reload_time())
				
				var lpc =LPC.instance()
				last_played_card_holder.add_child(lpc)
				#value,color,travel,duration,spread
				lpc.show_value(last_played_card, 
				CardManager.get_type_color(last_played_card.get_card_type()),
				Vector2(0,-80),
				2,
				PI/2)
				
				AudioManager.play("res://Assets/Sounds/"+last_played_card.get_card_sound()+ ".wav")
		else:
			pass
	
	char_name.text = character_data.get_character_name()
	health.value = character_data.get_health()

	
func take_damage(val:int)->void:
	character_data.set_health(character_data.get_health()-val)

func heal(val:int)->void:
	character_data.set_health(character_data.get_health()+val)

