class_name Entity
extends KinematicBody2D

export (bool) var _debug = false

onready var state_machine_debug: Control = $StateMachineDebug


func _ready():
	if not _debug:
		state_machine_debug.hide()
