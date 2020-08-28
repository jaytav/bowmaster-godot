class_name Entity
extends KinematicBody2D
"""
Entity are a game object which contains Stats and StateMachine nodes
"""

export (bool) var _debug = false

onready var state_machine: StateMachine = $StateMachine
onready var _state_machine_debug: Control = $StateMachineDebug


func _ready():
	if not _debug:
		_state_machine_debug.hide()
