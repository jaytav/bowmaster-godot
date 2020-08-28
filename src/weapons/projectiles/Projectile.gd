extends Weapon


func launch(from_position: Vector2, to_position: Vector2):
	state_machine.transition_to("Move", {
		"from_position": from_position,
		"to_position": to_position
	})
