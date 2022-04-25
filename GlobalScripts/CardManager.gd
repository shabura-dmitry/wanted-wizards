extends Node
var CardBase = load("res://Scenes/Cards/CardBase.gd")
enum Cards {BasicShot,QuickShot,ScatterShot,PiercingShot,SelfInflicted,FriendlyFire}
enum DamageTypes {Base,Pierce,HealMates,HealSelf}


func generate_card(card):
	match card:
		Cards.BasicShot:
			return CardBase.new("Basic Shot"
			, "Deals 5 damage to target"
			,"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			[DamageTypes.Base])
			
		Cards.QuickShot:
			return CardBase.new("Quick Shot"
			, "Deals 2x2 damage to target"
			,"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			[DamageTypes.Base])
			
		Cards.ScatterShot:
			return CardBase.new("Scatter Shot"
			,"Deals 1 damage to all enemies"
			,"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			[DamageTypes.Base])
			
		Cards.PiercingShot:
			return CardBase.new("Piercing Shot",
			"Deals 5 damage + 1 damage to enemy barrier",
			"res://Assets/Cards/Card_Pictures/9mm_barrier_piercing_shot.png",
			[DamageTypes.Base, DamageTypes.Pierce])
			
		Cards.SelfInflicted:
			return CardBase.new("Self Inflicted",
			"Heal self for 1 hp",
			"res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			[DamageTypes.HealSelf])
						
		Cards.FriendlyFire:
			return CardBase.new("Friendly Fire",
			"Heal all teammates by 1hp",
			"res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			[DamageTypes.HealMates])
