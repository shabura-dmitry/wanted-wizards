extends Node
enum ZoneTypes {Battle,Boss,Shop}
enum BattleTypes {Magic}

func _ready():
	randomize()

func get_zones(num_zones):
	var zone_q = []
	zone_q.append(get_battle(ZoneTypes.Battle,1,1))
	for _z in range(1,num_zones):
		var zone_choice = ZoneTypes.keys()[randi() % ZoneTypes.keys().size()]
		zone_choice = ZoneTypes[zone_choice]
		#print(zone_choice)
		
		match zone_choice:
			ZoneTypes.Battle:
				zone_q.append(get_battle(ZoneTypes.Battle, 3, 1))
				
			ZoneTypes.Boss:
				zone_q.append(get_battle(ZoneTypes.Boss, 1, 10))
				
			ZoneTypes.Shop:
				zone_q.append(get_shop(3,1,1))
	return zone_q

func get_shop(card_num,card_rarity, cost_mult):
	var shop = ShopZone.new()
	var cards = []
	for _n in range(0,card_num):
		var card_choice = CardManager.Cards.keys()[randi() % CardManager.Cards.keys().size()]
		var card = CardManager.generate_card(CardManager.Cards[card_choice])
		while card.get_card_rarity() != card_rarity:
			card_choice = CardManager.Cards.keys()[randi() % CardManager.Cards.keys().size()]
			card = CardManager.generate_card(CardManager.Cards[card_choice])
		
		card.set_card_cost(card.get_card_cost() * cost_mult)
		cards.append(card)
	shop.shop_items = cards
	shop.name = "ShopZone"
	return shop

func get_battle(zone_type, num_enemies,diff)->BattleZone:
	var zone_name = ""
	var battle_type = BattleTypes.keys()[randi() % BattleTypes.keys().size()]
	battle_type = BattleTypes[battle_type]
	var enemy_q = get_enemy_q(zone_type,battle_type,num_enemies,diff)
	var battle = BattleZone.new()
	battle.set_enemy_q(enemy_q)
	match zone_type:
		ZoneTypes.Battle:
			zone_name += "Battle "
		ZoneTypes.Boss:
			zone_name += "Boss "
	match battle_type:
		BattleTypes.Magic:
			zone_name += "- Magic"
	battle.name = zone_name
	return battle

func get_possible_enemies(zone_type, battle_type)->Array:
	match zone_type:
		ZoneTypes.Battle:
			match battle_type:
				BattleTypes.Magic:
					return [CharacterPresets.EnemyList.WizardDog,
							CharacterPresets.EnemyList.WizardMushroom]

		ZoneTypes.Boss:
			match battle_type:
				BattleTypes.Magic:
					return [CharacterPresets.EnemyList.Wizard]

	return []


func get_enemy_q(zone_type,battle_type,num_enemies, diff):
	var possible_enemies = get_possible_enemies(zone_type,battle_type)
	var enemy_data = []
	var enemy_q =[]


	for n in range(0,num_enemies):
		var enemy = possible_enemies[randi() % possible_enemies.size()]
		enemy = CharacterPresets.get_enemy(enemy)
		enemy.set_health(enemy.get_health() * diff)
		enemy.set_default_party_pos(n+1)
		enemy_data.append(enemy)
		
	for e in enemy_data:
		var enemy_scene = load("res://Scenes/Character.tscn").instance()
		enemy_scene.character_data = e
		enemy_q.append(enemy_scene)
		
	
	return enemy_q


