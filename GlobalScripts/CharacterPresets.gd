extends Node
enum EnemyList {Wizard, WizardDog, WizardMushroom}
var WizardSprite = "res://Assets/Characters/Wizard1.png"
var WizardDogSprite = "res://Assets/Characters/Wizard_Dog1.png"
var WizardMushroomSprite = "res://Assets/Characters/Mushroom_Wizard1.png"
var TreasureSprite = "res://Assets/Characters/Treasure1.png"
var SlingerSprite = "res://Assets/Characters/Cowboy1.png"
var KnightSprite = "res://Assets/Characters/Knight1.png"
var SorcererSprite = "res://Assets/Characters/Sorceror1.png"
func img(string):
	return "res://Assets/Characters/"+string +".png"
	
	

##-------------- FUTURE FORMAT: ------------------------
#var enemy = [
#	new_enemy(true,"Wizard",50,WizardSprite,Vector2(1,2),1)
#]
#func new_enemy(is_enemy,_name,max_health, sprite, battle_timer_range,bounty):
#	var data =CharacterData.new(is_enemy,_name,max_health,sprite,battle_timer_range,bounty)
#	if is_enemy:
#		data.set_is_enemy(true)
#		data.set_bounty(1)
#		data.set_deck(CardManager.generate_spell(CardManager.Spells.BasicSpell))
#	else:
#		data.set_is_enemy(false)
#		data.set_bounty(0)
#		data.set_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
##------------------------------------------------------
	
	
	
func get_enemy(enemy):
	match enemy:
		EnemyList.Wizard:
			return get_wizard()
		EnemyList.WizardDog:
			return get_wizard_dog()
		EnemyList.WizardMushroom:
			return get_wizard_mushroom()
			
func get_wizard_mushroom():
	var wizarmush = CharacterData.new("Wizard Mushroom")
	wizarmush.set_is_enemy(true)
	wizarmush.add_to_deck(CardManager.generate_spell(CardManager.Spells.BasicSpell))
	
	wizarmush.set_max_health(35)
	wizarmush.set_health(35)
	
	wizarmush.set_default_party_pos(1)
	wizarmush.set_current_party_pos(1)
	
	wizarmush.set_battle_timer_range(Vector2(1,2))
	wizarmush.set_sprite(img("Mushroom_Wizard1"))
	
	wizarmush.set_bounty(1)
	return wizarmush
func get_slinger():
	var slinger= CharacterData.new("Gun Slinger")
	slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	#slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	#slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.BasicShot))
	#slinger.add_to_deck(CardManager.generate_card(CardManager.Cards.SelfShot))

	
	slinger.set_max_health(400)
	slinger.set_health(400)

	slinger.set_default_party_pos(1)
	slinger.set_current_party_pos(1)
	slinger.set_battle_timer_range(Vector2(.5,1.5))
	
	slinger.set_sprite(img("Cowboy1"))
	return slinger
	
func get_knight():
	var knight= CharacterData.new("Knight")
	knight.add_to_deck(CardManager.generate_card(CardManager.Cards.HeavyShot))
	#knight.add_to_deck(CardManager.generate_card(CardManager.Cards.HeavyShot))
	#knight.add_to_deck(CardManager.generate_card(CardManager.Cards.HeavyShot))
	#knight.add_to_deck(CardManager.generate_card(CardManager.Cards.ToughLove))
	
	knight.set_max_health(600)
	knight.set_health(600)

	knight.set_default_party_pos(1)
	knight.set_current_party_pos(1)
	knight.set_battle_timer_range(Vector2(1.5,2.5))
	
	knight.set_sprite("res://Assets/Characters/Knight1.png")
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
	wizard.set_sprite(img("Wizard1"))
	
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
	wizarddog.set_sprite(img("Wizard_Dog1"))
	
	wizarddog.set_bounty(1)
	return wizarddog
