extends State

func physics_process(delta):
	if not parent.edge_detector.is_colliding() and owner.is_on_floor() or owner.is_on_wall():
		state_machine.transition_to("Move/Idle", {"turn": true})
	
	.physics_process(delta)
