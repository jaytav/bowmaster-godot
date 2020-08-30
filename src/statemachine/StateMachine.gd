class_name StateMachine
extends Node

signal transitioned(state)

export (NodePath) var initial_state

onready var state: State = get_node(initial_state)


func _init():
	if !initial_state:
		push_error("StateMachine.initial_state not initialised")
	
	add_to_group("state_machine")


func _ready():
	yield(owner, "ready")
	state.enter()
	emit_signal("transitioned", state)


func _unhandled_input(event):
	state.unhandled_input(event)


func _physics_process(delta):
	state.physics_process(delta)


func transition_to(target_state_path: String, msg: Dictionary = {}):
	if not has_node(target_state_path):
		return
	
	state.exit()
	state = get_node(target_state_path)
	state.enter(msg)
	emit_signal("transitioned", state)
