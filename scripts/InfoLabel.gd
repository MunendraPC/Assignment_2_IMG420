extends Label
func _on_player_screen_wrapped(new_pos: Vector2) -> void:
	text = "Wrapped at: %s" % new_pos
