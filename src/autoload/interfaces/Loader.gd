class_name Loader
extends Node

var folder: String

var _loaded: Dictionary = {}


func get_instance(value: String, msg: Dictionary = {}) -> Node:
	if not value in _loaded:
		_loaded[value] = load(folder + value + ".tscn")
	
	var instance: Node = _loaded[value].instance()
	
	for prop in msg:
		instance.set(prop, msg[prop])
	
	return instance
