class_name MainScene
extends Node

var _scene: Node


func init(scene: Node):
	_scene = scene


func get(child_tree: String):
	return _scene.get_node(child_tree)


func add(child_scene: Node):
	_scene.add_child(child_scene)


func clear():
	for child in _scene.get_children():
		child.queue_free()
