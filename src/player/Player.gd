tool
extends Entity

onready var Arrow: PackedScene = load("src/weapons/projectiles/arrows/BasicArrow.tscn")


func _input(event):
	if event.is_action_pressed("shoot"):
		var arrow_instance = Arrow.instance()
		get_parent().add_child(arrow_instance)
		arrow_instance.launch(get_global_position(), get_global_mouse_position())


func _on_Health_current_health_updated(current_health):
	if current_health == 0:
		MainGUI.clear()
		MainWorld.clear()
		MainGUI.add(Scenes.GameOverGUI)
