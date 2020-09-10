extends Effect

export (int) var value

# Health Stat
onready var _health


func can_apply(entity: Node) -> bool:
	_health = entity.get_node("Stats/Health")
	return _health != null


func do_effect():
	_health.heal(value)
	return
