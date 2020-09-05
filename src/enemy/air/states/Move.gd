extends State

export (float) var _acceleration
export (CircleShape2D) var _patrol_area_shape
export (CircleShape2D) var _target_position_shape

var max_speed: float

var _velocity := Vector2()
var _current_target_area: Area2D
var _current_patrol_area: Area2D
var _rng := RandomNumberGenerator.new()

onready var _area: PackedScene = preload("res://src/enemy/patrol/PatrolArea.tscn")


func enter(msg: Dictionary = {}):
	_set_current_patrol_area()
	state_machine.transition_to("Move/Idle")


func physics_process(delta):
	_set_velocity(state_machine.state)
	_velocity = owner.move_and_slide(_velocity, Vector2.UP)


func _set_velocity(state: State):
	var target_position = _current_target_area.position if _current_target_area else owner.position
	
	if state.name == "Follow":
		target_position = state.target.position
	elif state.name == "Move":
		target_position = owner.position
	
	var move_direction = owner.position.direction_to(target_position)
	
	if move_direction.x > 0:
		_velocity.x = min(_velocity.x + _acceleration, max_speed)
	elif move_direction.x < 0:
		_velocity.x = max(_velocity.x - _acceleration, -max_speed)
	
	if move_direction.y > 0:
		_velocity.y = min(_velocity.y + _acceleration, max_speed)
	elif move_direction.y < 0:
		_velocity.y = max(_velocity.y - _acceleration, -max_speed)


func _set_current_patrol_area():
	if _current_patrol_area:
		_current_patrol_area.queue_free()
	
	_current_patrol_area = _area.instance()
	_current_patrol_area.position = owner.position
	_current_patrol_area.get_node("CollisionShape2D").set_shape(_patrol_area_shape)
	MainWorld.add(_current_patrol_area)


func set_target_position():
	if _current_target_area:
		_current_target_area.queue_free()
	
	_rng.randomize()
	var n = _rng.randf_range(0, 1)
	var r = _patrol_area_shape.radius * sqrt(n)
	var theta = n * 2 * PI
	
	_current_target_area = _area.instance()
	_current_target_area.position.x = _current_patrol_area.position.x + r * cos(theta)
	_current_target_area.position.y = _current_patrol_area.position.y + r * sin(theta)
	_current_target_area.get_node("CollisionShape2D").set_shape(_target_position_shape)
	_current_target_area.connect("body_entered", self, "_on_current_target_area_entered")
	MainWorld.add(_current_target_area)


func _on_current_target_area_entered(body):
	if body.get_instance_id() == owner.get_instance_id():
		state_machine.transition_to("Move/Idle")


func _on_DetectionRange_body_entered(body):
	state_machine.transition_to("Move/Follow", {"body": body})


func _on_DetectionRange_body_exited(body):
	state_machine.transition_to("Move")
	set_target_position()
