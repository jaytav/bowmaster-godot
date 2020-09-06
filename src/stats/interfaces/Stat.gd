class_name Stat
extends Node

signal value_updated(value)

export (int) var initial_value

var value setget set_value


func _ready():
	self.value = initial_value


func set_value(new_value: int):
	value = new_value
	emit_signal("value_updated", value)
