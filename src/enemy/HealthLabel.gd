extends Label

onready var _health: Node = owner.get_node("Stats/Health")


func _ready():
	text = str(_health.current_health) + " HP"
	_health.connect("current_health_updated", self, "_on_Health_current_health_updated")


func _on_Health_current_health_updated(current_health):
	text = str(current_health) + " HP"
