extends VBoxContainer
var character_data:CharacterData
onready var name_label = get_node("Name")
onready var character_sprite =get_node("CC/CharacterSprite")
onready var dmg_label = get_node("CC2/HBoxContainer/DmgLabel")
onready var armor_label = get_node("CC2/HBoxContainer/ArmorLabel")
onready var health_label = get_node("CC2/HBoxContainer/HealthLabel")
onready var mana_label = get_node("CC2/HBoxContainer/ManaLabel")

func update():
	if character_data:
		name_label.text = str(character_data.get_character_name())
		character_sprite.texture = load(character_data.get_sprite())
		dmg_label.text = str(character_data.get_base_damage())
		armor_label.text = str(character_data.get_max_armor())
		health_label.text = str(character_data.get_max_health())
		mana_label.text = str(character_data.get_max_mana())
