class_name MainScene
extends Node

var _scene: Node


func init(scene: Node) -> void:
	_scene = scene


func get(child_tree: String) -> Node:
	return _scene.get_node(child_tree)


func add(child_scene: Node) -> void:
	_scene.add_child(child_scene)


func add_to(child_scene: Node, to_child: String):
	_scene.get_node(to_child).add_child(child_scene)


func clear() -> void:
	for child in _scene.get_children():
		child.queue_free()
