extends Node

func get_slinger():
	var slinger= CharacterData.new("Gun Slinger")
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	
	slinger.set_max_health(10)
	slinger.set_health(10)
	#slinger.set_max_armor(0)
	#slinger.set_max_mana(0)
	
	slinger.set_default_party_pos(1)
	slinger.set_current_party_pos(1)
	
	slinger.set_sprite("res://Assets/DimasCowboy.png")
	return slinger
	

#func get_knight():
#	var knight = CharacterData.new("Knight")
#	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.PiercingShot))
#	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
#	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.ScatterShot))
#	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.ScatterShot))
#
#	knight.set_max_health(14)
#	knight.set_max_armor(2)
#	knight.set_max_mana(0)
#
#	knight.set_sprite("res://Assets/DimasKnight.png")
#	return knight
#
#func get_sorcerer():
#	var sorc = CharacterData.new("Sorcerer")
#	sorc.add_to_deck(CardManager.generate_card(CardManager.Cards.SelfInflicted))
#	sorc.add_to_deck(CardManager.generate_card(CardManager.Cards.SelfInflicted))
#	sorc.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
#	sorc.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
#
#	sorc.set_max_health(5)
#	sorc.set_max_armor(0)
#	sorc.set_max_mana(2)
#
#	sorc.set_sprite("res://Assets/DimasSorcerer.png")
#	return sorc
