class_name StateMachine
extends Node

export (NodePath) var initial_state

onready var state: State = get_node(initial_state)


func _init():
	add_to_group("state_machine")


func _ready():
	yield(owner, "ready")
	state.enter()


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
