extends State

func physics_process(delta):
	if parent.get_move_direction().x != 0.0:
		state_machine.transition_to("Move/Run")
