extends KinematicBody2D

export (float) var acceleration
export (float) var max_speed
export (float) var gravity
export (float) var jump_power

export (int) var health

onready var arrow = load("Arrow/Arrow.tscn")
onready var camera = get_node("Camera2D")

var movement = Vector2()
var health_ui = MainGUI.get("GameGUI/PlayerHealth")
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

func _input(event):
	if event.is_action_pressed("shoot"):
		var arrow_instance = arrow.instance()
		arrow_instance.position = get_global_position()
		arrow_instance.movement = (get_global_mouse_position() - arrow_instance.position).normalized()
		get_parent().add_child(arrow_instance)

func take_damage(damage):
	health = max(health - damage, 0)
	health_ui.text = str(health) + " HP"
	
	if health == 0:
		MainGUI.clear()
		MainWorld.clear()
		MainGUI.add(Scenes.GameOverGUI)

func _on_Player_ready():
	return
	health_ui.text = str(health) + " HP"
