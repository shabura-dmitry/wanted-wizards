extends Node


func upgrade_fire_speed(character, val):
	var o_range = character.get_battle_timer_range()
	character.set_battle_timer_range(Vector2(o_range.x,o_range.y - val))

func upgrade_max_health(character,val):
	character.set_max_health(character.get_max_health() + val)
	
func upgrade_base_damage(val):
	for c in SavingLoading.game_data["full_deck"]:
		if c.get_card_type() == CardManager.CardTypes.Attack:
			c.set_damage(c.get_damage() +val)
