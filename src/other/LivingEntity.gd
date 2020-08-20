class_name LivingEntity
extends KinematicBody2D

export (int) var _max_health: int setget _set_max_health

var _current_health: int setget _set_current_health
var _health_label: Label


func _ready():
	_health_label_ready()

	# set max health to re-run setters
	_set_max_health(_max_health)


func take_damage(amount: int):
	self._current_health -= amount


func heal(amount: int):
	self._current_health += amount


func _set_max_health(value: int):
	_max_health = value
	self._current_health = _max_health


func _set_current_health(value: int):
	_current_health = clamp(value, 0, _max_health)
	
	if _current_health == 0:
		die()
	
	if _health_label:
		_health_label.text = str(_current_health) + " HP"


func die():
	queue_free()


func _health_label_ready():
	# set _health_label value here
	pass
