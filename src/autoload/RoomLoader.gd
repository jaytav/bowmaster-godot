extends Loader

func _init():
	folder = "res://src/level/rooms/"

func get_instance(value: String, msg: Dictionary = {}) -> Node:
	value += "Room"
	return .get_instance(value, msg)
