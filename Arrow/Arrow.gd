extends KinematicBody2D

export (float) var initial_speed
export (float) var gravity
export (int) var damage

var movement = Vector2()
var last_position = Vector2()

func _ready():
	look_at(position + movement)
	last_position = position
	movement *= initial_speed

func _process(delta):
	# prevent jittery rotation
	if position.distance_to(last_position) > 5:
		rotation = atan2(position.y - last_position.y, position.x - last_position.x)
		last_position = position

func _physics_process(delta):
	movement.y += gravity
	movement = move_and_slide(movement)

func _on_Hitbox_body_entered(body):
	if body is KinematicBody2D && body.name.begins_with("Enemy"):
		body.take_damage(damage)
	
	# destroy arrow on any collision
	queue_free()
	
