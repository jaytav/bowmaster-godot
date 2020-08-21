extends Node

signal current_health_updated(current_health)

export (int) var _max_health

onready var current_health = _max_health


func take_damage(damage: int):
	current_health = clamp(current_health - damage, 0, _max_health)
	emit_signal("current_health_updated", current_health)


func heal(amount: int):
	take_damage(-amount)
