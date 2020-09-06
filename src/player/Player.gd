tool
extends Entity

export (float) var _ammo_replenishment_time

onready var Arrow: PackedScene = load("src/weapons/projectiles/arrows/BasicArrow.tscn")
onready var _ammo = $Stats/Ammo
onready var _ammo_replenishment_timer = $Stats/Ammo/ReplenishmentTimer


func _input(event):
	if event.is_action_pressed("shoot") and _ammo.value > 0:
		var arrow_instance = Arrow.instance()
		MainWorld.add(arrow_instance)
		arrow_instance.launch(get_global_position(), get_global_mouse_position())
		_ammo.shoot()


func _on_Health_depleted():
	MainGUI.clear()
	MainWorld.clear()
	MainGUI.add(Scenes.load("GameOverGUI"))


func _on_Ammo_current_ammo_updated(current_ammo):
	if current_ammo < _ammo.capacity:
		_ammo_replenishment_timer.start(_ammo_replenishment_time)
	else:
		_ammo_replenishment_timer.stop()


func _on_ReplenishmentTimer_timeout():
	_ammo.replenish()
