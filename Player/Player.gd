extends KinematicBody2D

export (float) var acceleration
export (float) var max_speed
export (float) var gravity
export (float) var jump_power

var movement = Vector2()
var friction = false

func _physics_process(delta):
	movement.y += gravity
	friction = false
	
	if Input.get_action_strength("right"):
		movement.x = min(movement.x + acceleration, max_speed)
	elif Input.get_action_strength("left"):
		movement.x = max(movement.x - acceleration, -max_speed)
	else:
		friction = true
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			movement.y = -jump_power
		if friction == true:
			movement.x = lerp(movement.x, 0, 0.2)
	elif friction == true:
		movement.x = lerp(movement.x, 0, 0.1)
	
	movement = move_and_slide(movement, Vector2.UP)
