class_name Interactable
extends RigidBody2D

onready var _highlight = $Highlight


func highlight():
	_highlight.visible = true


func unhighlight():
	_highlight.visible = false


func get_interacted_with(interactor: KinematicBody2D):
	pass
