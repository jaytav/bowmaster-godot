extends KinematicBody2D

export (float) var _initial_speed
export (float) var _gravity
export (int) var _damage

var movement = Vector2()

var _last_position = Vector2()


func _ready():
	look_at(position + movement)
	_last_position = position
	movement *= _initial_speed


func _process(delta):
	# prevent jittery rotation
	if position.distance_to(_last_position) > 5:
		rotation = atan2(position.y - _last_position.y, position.x - _last_position.x)
		_last_position = position


func _physics_process(delta):
	movement.y += _gravity
	movement = move_and_slide(movement)


func _on_Hitbox_body_entered(body):
	if body is KinematicBody2D && body.name.begins_with("Enemy"):
		body.take_damage(_damage)
	
	# destroy arrow on any collision
	queue_free()
	
