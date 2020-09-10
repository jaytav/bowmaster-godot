class_name Stat
extends Node

signal value_updated(value)

export (int) var initial_value

var value: int setget set_value


func _ready() -> void:
	self.value = initial_value


func set_value(new_value: int) -> void:
	value = new_value
	emit_signal("value_updated", value)
