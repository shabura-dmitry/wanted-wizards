extends Node
var CardBase = load("res://Scenes/Cards/CardBase.gd")
enum Cards {BasicShot,HeavyShot,BasicSpell,SelfShot,ToughLove}
enum CardTypes {Attack, Heal}

func get_type_color(type):
	match type:
		CardTypes.Attack:
			return Color(1,.38,0)
		CardTypes.Heal:
			return Color(.07,.95,.33)
func generate_card(card):
	#if character
	match card:
		null:
			return CardBase.new("","","","",0)
			
		Cards.BasicShot:
			return CardBase.new(CardTypes.Attack,"Basic Shot",
			"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			"gun_1",
			5,
			0)
			
		Cards.HeavyShot:
			return CardBase.new(CardTypes.Attack,"Heavy Shot",
			"res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			"gun_2",
			15,
			2)
			
		Cards.SelfShot:
			return CardBase.new(CardTypes.Heal, "Self Shot",
			"res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			"heal_1",
			8,
			.5)
		
		Cards.ToughLove:
			return CardBase.new(CardTypes.Heal, "Tough Love",
			"res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			"heal_1",
			20,
			2)
		
			
		
			
			
		Cards.BasicSpell:
			return CardBase.new(CardTypes.Attack,"Basic Spell",
			"res://Assets/Cards/Card_Pictures/Barrier.png",
			"spell_1",
			8,
			0)
