class_name MainScene
extends Node

var _scene: Node


func init(scene: Node):
	_scene = scene


func add(child_scene: PackedScene):
	_scene.add_child(child_scene.instance())


func clear():
	for child in _scene.get_children():
		child.queue_free()
