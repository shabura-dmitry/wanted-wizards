extends Reference
class_name Trinket
var trinket_name = "" setget set_trinket_name,get_trinket_name


func set_trinket_name(val:String)->void:
	if val.length() >0:
		trinket_name = val
		
func get_trinket_name()->String:
	return trinket_name


func to_string():
	var s = "["+trinket_name+"]"
	return s
