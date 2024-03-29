extends InstantEffect

export (int) var value

# Health Stat
onready var _health: Health


func can_apply(entity: Node) -> bool:
	_health = entity.get_node("Stats/Health")
	return _health != null


func do_effect() -> void:
	_health.take_damage(value)
