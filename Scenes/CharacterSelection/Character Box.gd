extends VBoxContainer
var character_data:CharacterData
onready var name_label = get_node("Name")
onready var character_sprite =get_node("CC/CharacterSprite")


var card_template = load("res://Scenes/Cards/CardTemplate.tscn")
onready var starter_deck = get_node("CC3/StarterDeck")

func _ready():
	update()
func update():

	if character_data:
		name_label.text = str(character_data.get_character_name())
		character_sprite.texture_normal = load(character_data.get_sprite())
		
		for card in character_data.get_deck():
			var new_card = card_template.instance()
			new_card.card =card
			new_card.update()
			starter_deck.add_child(new_card)


func _on_CharacterSprite_pressed():
	var extra = CharacterPresets.get_slinger()
	extra.set_default_party_pos(2)
	extra.set_current_party_pos(2)
	var extra2 = CharacterPresets.get_slinger()
	extra2.set_default_party_pos(4)
	extra2.set_current_party_pos(4)
	SavingLoading.game_data["party"] = [extra,character_data,extra2]
	get_tree().get_root().get_node("Game").set_current_scene("res://Scenes/Battle.tscn")
