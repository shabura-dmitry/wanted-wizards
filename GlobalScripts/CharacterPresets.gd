extends Node
enum EnemyList {Wizard, WizardDog}


func get_enemy(enemy):
	match enemy:
		EnemyList.Wizard:
			return get_wizard()
		EnemyList.WizardDog:
			return get_wizard_dog()
			
			
func get_slinger():
	var slinger= CharacterData.new("Gun Slinger")
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.SelfShot))

	
	slinger.set_max_health(40)
	slinger.set_health(40)

	slinger.set_default_party_pos(1)
	slinger.set_current_party_pos(1)
	slinger.set_battle_timer_range(Vector2(.5,1.5))
	
	slinger.set_sprite("res://Assets/DimasCowboy.png")
	return slinger
	
func get_knight():
	var knight= CharacterData.new("Knight")
	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.HeavyShot))
	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.HeavyShot))
	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.HeavyShot))
	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.ToughLove))
	
	knight.set_max_health(60)
	knight.set_health(60)

	knight.set_default_party_pos(1)
	knight.set_current_party_pos(1)
	knight.set_battle_timer_range(Vector2(1.5,2.5))
	
	knight.set_sprite("res://Assets/DimasKnight.png")
	return knight
	
	
func get_wizard():
	var wizard = CharacterData.new("Wizzy")
	wizard.set_is_enemy(true)
	wizard.add_to_deck(CardManager.generate_spell(CardManager.Spells.BasicSpell))
	
	wizard.set_max_health(35)
	wizard.set_health(35)
	
	wizard.set_default_party_pos(1)
	wizard.set_current_party_pos(1)
	
	wizard.set_battle_timer_range(Vector2(4,5))
	wizard.set_sprite("res://Assets/Wizard.png")
	
	wizard.set_bounty(2)
	return wizard

func get_wizard_dog():
	var wizarddog = CharacterData.new("Wizard Dog")
	wizarddog.set_is_enemy(true)
	wizarddog.add_to_deck(CardManager.generate_spell(CardManager.Spells.BasicSpell))
	
	wizarddog.set_max_health(35)
	wizarddog.set_health(35)
	
	wizarddog.set_default_party_pos(1)
	wizarddog.set_current_party_pos(1)
	
	wizarddog.set_battle_timer_range(Vector2(1,2))
	wizarddog.set_sprite("res://Assets/Wizard_Dog.png")
	
	wizarddog.set_bounty(1)
	return wizarddog
