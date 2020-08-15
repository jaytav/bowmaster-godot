extends State

func handle_input(event):
	if event.is_action_pressed("left") || event.is_action_pressed("right"):
		emit_signal("finished", "TestMove")
