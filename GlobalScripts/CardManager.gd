extends Node
var CardBase = load("res://Scripts/CardBase.gd")
enum Cards {BasicShot,HeavyShot,SelfShot,ToughLove}
enum Spells {BasicSpell}
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
		#_init(_type, _card_name, _card_picture,_card_sound,_damage, _reload,_rarity,_cost)
		null:
			return CardBase.new("","","","",0,0)
			
		Cards.BasicShot:
			return CardBase.new(CardTypes.Attack,"Basic Shot", "res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			"gun_1",10,0,1,1)
			
		Cards.HeavyShot:
			return CardBase.new(CardTypes.Attack,"Heavy Shot","res://Assets/Cards/Card_Pictures/9mm_basic_shot.png",
			"gun_2",20,1.5,2,5)
			
		Cards.SelfShot:
			return CardBase.new(CardTypes.Heal, "Self Shot","res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			"heal_1",-5,1.5,3,10)
		
		Cards.ToughLove:
			return CardBase.new(CardTypes.Heal, "Tough Love","res://Assets/Cards/Card_Pictures/9mm_friendly_fire.png",
			"heal_1",-20,4,3,20)
		
			
		
func generate_spell(spell):
	match spell:
		Spells.BasicSpell:
			return SpellBase.new(CardTypes.Attack,"Basic Spell",
			"res://Assets/Cards/Card_Pictures/Barrier.png",
			"spell_1",
			8,0)
