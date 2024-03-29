extends State

export (float) var acceleration
export (float) var max_speed
export (float) var gravity

var velocity: Vector2 = Vector2()

onready var _range: Area2D = owner.get_node("DetectionRange")
onready var edge_detector: RayCast2D = owner.get_node("EdgeDetector")


func physics_process(delta: float) -> void:
	set_velocity(state_machine.state)
	velocity = owner.move_and_slide(velocity, Vector2.UP)


func get_move_direction() -> Vector2:
	return Vector2(edge_detector.position.x, 0.0)


func set_velocity(state: State) -> void:
	velocity.y += gravity
	
	if state.name == "Idle":
		velocity.x = lerp(velocity.x, 0, 0.2)
		return
	elif state.name == "Stagger":
		velocity.x = lerp(velocity.x, 0,  0.75)
		return
	
	var move_direction = get_move_direction()
	
	if move_direction.x > 0:
		velocity.x = min(velocity.x + acceleration, max_speed)
	elif move_direction.x < 0:
		velocity.x = max(velocity.x - acceleration, -max_speed)


func turn() -> void:
	edge_detector.position.x *= -1
	_range.position.x *= -1
