class_name Ammo
extends ReplenishStat


func shoot(amount: int = 1) -> void:
	set_value(value - amount)
