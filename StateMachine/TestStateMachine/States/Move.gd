extends State

func unhandled_input(event):
	if event.is_action_pressed("jump"):
		print("Jumped")


func get_move_direction():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), 0)
