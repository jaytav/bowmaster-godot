extends State

export (float) var _max_speed


func enter(msg: Dictionary = {}) -> void:
	parent.max_speed = _max_speed
	parent.set_target_position()


func physics_process(delta: float) -> void:
	# transition to Idle when touching floor/wall/ceiling
	if owner.is_on_floor() or owner.is_on_wall() or owner.is_on_ceiling():
		state_machine.transition_to("Move/Idle")
	
	.physics_process(delta)
