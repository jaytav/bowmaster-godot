extends State

func enter(msg: Dictionary = {}) -> void:
	if "jump_power" in msg:
		parent.velocity.y -= parent.jump_power


func physics_process(delta: float) -> void:
	if owner.is_on_floor():
		if parent.get_move_direction().x == 0:
			state_machine.transition_to("Move/Idle")
		else:
			state_machine.transition_to("Move/Run")
	
	parent.set_velocity(self)
	.physics_process(delta)
