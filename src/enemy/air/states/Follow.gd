extends State

export (float) var _max_speed

var target: Node


func enter(msg: Dictionary = {}) -> void:
	parent.max_speed = _max_speed
	target = msg.body
