tool
class_name LivingWeapon
extends Weapon

onready var _health_label: Label = $EntityUI/HealthLabel
onready var _health: Health = $Stats/Health

func _ready():
	_health_label.text = str(_health.current_health) + " / " + str(_health.max_health)


func _on_Health_current_health_updated(current_health):
	if current_health == 0:
		queue_free()
	
	_health_label.text = str(_health.current_health) + " / " + str(_health.max_health)
