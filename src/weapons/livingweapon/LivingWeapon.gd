tool
class_name LivingWeapon
extends Weapon

onready var _health_label: Label = $EntityUI/HealthLabel
onready var _health: Health = $Stats/Health

func _ready():
	_on_Health_value_updated(_health.value)


func _on_Health_value_updated(value):
	if !_health:
		return
	
	_health_label.text = str(_health.value) + " / " + str(_health.max_value)


func _on_Health_depleted():
	queue_free()
