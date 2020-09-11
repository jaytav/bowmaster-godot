class_name Loader
extends Node

var folder: String

var _loaded: Dictionary = {}


func get_instance(value: String) -> Node:
	if not value in _loaded:
		_loaded[value] = load(folder + value + ".tscn")
	
	return _loaded[value].instance()
