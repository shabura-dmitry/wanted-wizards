extends Node

func get_slinger():
	var slinger= CharacterData.new("Gun Slinger")
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	
	slinger.set_max_health(1000)
	slinger.set_health(1000)

	slinger.set_default_party_pos(1)
	slinger.set_current_party_pos(1)
	slinger.set_battle_timer_range(Vector2(.5,1.5))
	
	slinger.set_sprite("res://Assets/DimasCowboy.png")
	return slinger
	
func get_wizard():
	var wizard = CharacterData.new("Wizzy")
	wizard.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicSpell))
	
	wizard.set_max_health(25)
	wizard.set_health(25)
	
	wizard.set_default_party_pos(1)
	wizard.set_current_party_pos(1)
	
	wizard.set_battle_timer_range(Vector2(4,5))
	wizard.set_sprite("res://Assets/Wizard.png")
	return wizard

