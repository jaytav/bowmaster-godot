extends KinematicBody2D

export (float) var acceleration
export (float) var max_speed
export (float) var gravity

export (int) var health
export (int) var damage

var movement = Vector2()
var friction = false
var direction = 1

onready var health_ui = $EnemyUI/Health

func _physics_process(delta):
	movement.y += gravity
	friction = false
	
	if $RayCast2D.is_colliding() == false && is_on_floor() || is_on_wall():
		_turn()
	
	if direction == 1:
		movement.x = min(movement.x + acceleration, max_speed)
	else:
		movement.x = max(movement.x - acceleration, -max_speed)
	
	movement = move_and_slide(movement, Vector2.UP)

func _turn():
	direction *= -1
	$RayCast2D.cast_to.x *= -1

func _on_Hitbox_body_entered(body):
	if body is KinematicBody2D && body.name.begins_with("Player"):
		body.take_damage(damage)

func _update_health_ui():
	health_ui.text = str(health) + " HP"

func take_damage(damage):
	health = max(health - damage, 0)
	_update_health_ui()
	
	if health == 0:
		queue_free()
