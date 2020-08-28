extends State

export (float) var _initial_speed
export (float) var _gravity

var _velocity := Vector2()
var _last_position := Vector2()

onready var _sprite = owner.get_node("Sprite")


func enter(msg: Dictionary = {"from_position": Vector2(), "to_position": Vector2()}):
	owner.position = msg.from_position
	_velocity = (msg.to_position - owner.position).normalized()
	_sprite.look_at(owner.position + _velocity)
	_velocity *= _initial_speed


func physics_process(delta):
	_velocity.y += _gravity
	
	_sprite.rotation = atan2(owner.position.y - _last_position.y, owner.position.x - _last_position.x)
	_last_position = owner.position
	
	_velocity = owner.move_and_slide(_velocity, Vector2.UP)
