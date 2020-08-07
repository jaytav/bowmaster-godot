extends KinematicBody2D

export (float) var _acceleration
export (float) var _max_speed
export (float) var _gravity
export (float) var _jump_power
export (int) var _health

var _movement = Vector2()
var _health_ui = MainGUI.get("GameGUI/PlayerHealth")
var _friction = false

onready var Arrow = load("Arrow/Arrow.tscn")


func _physics_process(delta):
	_movement.y += _gravity
	_friction = false
	
	if Input.get_action_strength("right"):
		_movement.x = min(_movement.x + _acceleration, _max_speed)
	elif Input.get_action_strength("left"):
		_movement.x = max(_movement.x - _acceleration, -_max_speed)
	else:
		_friction = true
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			_movement.y = -_jump_power
		if _friction == true:
			_movement.x = lerp(_movement.x, 0, 0.2)
	elif _friction == true:
		_movement.x = lerp(_movement.x, 0, 0.1)
	
	_movement = move_and_slide(_movement, Vector2.UP)


func _input(event):
	if event.is_action_pressed("shoot"):
		var arrow_instance = Arrow.instance()
		arrow_instance.position = get_global_position()
		arrow_instance.movement = (get_global_mouse_position() - arrow_instance.position).normalized()
		get_parent().add_child(arrow_instance)


func take_damage(damage):
	_health = max(_health - damage, 0)
	_health_ui.text = str(_health) + " HP"
	
	if _health == 0:
		MainGUI.clear()
		MainWorld.clear()
		MainGUI.add(Scenes.GameOverGUI)


func _on_Player_ready():
	_health_ui.text = str(_health) + " HP"
