extends Label

func show_value(value,color,travel,duration,spread):
	text = value.get_card_name()
	$TextureRect.texture = load(value.get_card_picture())
	var movement = travel.rotated(rand_range(-spread/2,spread/2))
	rect_pivot_offset = rect_size/2

	add_color_override("font_color", color)
	#text.modulate = color
	$Tween.interpolate_property(self, "rect_position",
	rect_position, rect_position + movement,
	duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$Tween.interpolate_property(self, "rect_scale",
	self.rect_scale, rect_scale * 2,
	duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$Tween.interpolate_property(self, "modulate:a",
	1.0, 0.0, duration,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	

	$Tween.start()
	yield($Tween, "tween_all_completed")
	queue_free()
