extends State

export (float) var acceleration
export (float) var max_speed
export (float) var gravity
export (float) var jump_power

var velocity := Vector2()


func unhandled_input(event):
	if event.is_action_pressed("jump") and owner.is_on_floor():
		state_machine.transition_to("Move/Air", {"jump_power": jump_power})
	elif not owner.is_on_floor():
		state_machine.transition_to("Move/Air")


func physics_process(delta):
	velocity = owner.move_and_slide(velocity, Vector2.UP)


func get_move_direction():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), 0.0)


func set_velocity(state: State):
	var move_direction = get_move_direction()
	var acceleration_multiplier
	var friction_weight
	
	if state.name == "Air":
		acceleration_multiplier = 0.5
		friction_weight = 0.05
	else:
		acceleration_multiplier = 1
		friction_weight = 0.2
	
	velocity.y += gravity
	
	if move_direction.x > 0:
		velocity.x = min(velocity.x + acceleration * acceleration_multiplier, max_speed)
	elif move_direction.x < 0:
		velocity.x = max(velocity.x - acceleration * acceleration_multiplier, -max_speed)
	else:
		velocity.x = lerp(velocity.x, 0, friction_weight)
