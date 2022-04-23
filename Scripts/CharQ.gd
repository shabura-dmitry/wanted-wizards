extends Node2D


var char_q

func _init(_char_q):
	char_q = _char_q
	
	
func cycle_chars(char_q):
	for character in char_q: #for every object in this array
		character.set_party_pos(character.get_party_pos() + 1 % char_q.size())
