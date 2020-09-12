class_name InstantEffect
extends Node
"""
Effect class with an instant effect
"""


func _ready():
	do_effect()
	queue_free()


func can_apply(entity: Node) -> bool:
	return true


func do_effect() -> void:
	pass
