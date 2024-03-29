extends State

func physics_process(delta: float) -> void:
	if owner.is_on_floor() and parent.get_move_direction().x != 0.0:
		state_machine.transition_to("Move/Run")
	elif not owner.is_on_floor():
		state_machine.transition_to("Move/Air")
	
	parent.set_velocity(self)
	.physics_process(delta)
