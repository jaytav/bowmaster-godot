extends LivingEntity

onready var Arrow = load("src/arrow/Arrow.tscn")


func _input(event):
	if event.is_action_pressed("shoot"):
		var arrow_instance = Arrow.instance()
		arrow_instance.position = get_global_position()
		arrow_instance.movement = (get_global_mouse_position() - arrow_instance.position).normalized()
		get_parent().add_child(arrow_instance)


func die():
	MainGUI.clear()
	MainWorld.clear()
	MainGUI.add(Scenes.GameOverGUI)
	.die()


func _health_label_ready():
	_health_label = MainGUI.get("GameGUI/PlayerHealth")
