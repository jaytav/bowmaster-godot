class_name Health
extends CapacityStat

signal depleted()


func take_damage(amount: int):
	set_value(value - amount)
	
	if value == 0:
		emit_signal("depleted")


func heal(amount: int):
	set_value(value + amount)
