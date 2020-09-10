class_name Health
extends CapacityStat

signal depleted()


func take_damage(amount: int) -> void:
	set_value(value - amount)
	
	if value == 0:
		emit_signal("depleted")


func heal(amount: int) -> void:
	set_value(value + amount)
