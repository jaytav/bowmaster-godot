extends State

func handle_input(event):
	if event.is_action_released("left") || event.is_action_released("right"):
		emit_signal("finished", "TestIdle")
