extends Node

signal current_health_updated(current_health)

export (int) var _max_health

onready var current_health = _max_health setget set_current_health


func take_damage(damage: int):
	self.current_health = clamp(current_health - damage, 0, _max_health)


func heal(amount: int):
	take_damage(-amount)


func set_current_health(amount: int):
	current_health = amount
	emit_signal("current_health_updated", current_health)
