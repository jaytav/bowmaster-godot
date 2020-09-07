extends Effect

export (int) var _value

# Health Stat
onready var _health = owner.get_node("Stats/Health")


func do_effect():
	_health.heal(_value)
