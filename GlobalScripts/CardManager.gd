extends Node
var CardBase = load("res://Scenes/Cards/CardBase.gd")
enum Cards {BasicShot, PiercingShot,FriendlyFire}
enum DamageTypes {Base,Pierce,HealMates,HealSelf}


func generate_card(card):
	match card:
		Cards.BasicShot:
			return CardBase.new("Basic Shot"
			, "A simple bullet that does damage based on characters base Damage stat"
			,"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			[DamageTypes.Base])
			
		Cards.PiercingShot:
			return CardBase.new("Piercing Shot",
			"A bullet that will do base damage while removing 1 point of enemies barrier",
			"res://Assets/Cards/Card_Pictures/9mm_barrier_piercing_shot.png",
			[DamageTypes.Base, DamageTypes.Pierce])
			
		Cards.FriendlyFire:
			return CardBase.new("Friendly Fire",
			"Heal all teammates by 1hp",
			"res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			[DamageTypes.HealMates])
