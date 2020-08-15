class_name State
extends Node

signal finished(next_state_name)


# Entering state
func enter():
	pass


# Exiting state
func exit():
	pass


# used in StateMachine::_input(event)
func handle_input(event):
	pass


# used in StateMachine::_physics_process(delta)
func update(delta):
	pass
