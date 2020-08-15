class_name StateMachine
extends KinematicBody2D

signal state_changed(new_state)

export (NodePath) var INITIAL_STATE

var _states_stack = []
var _states_map = {}
var _current_state: State


func _ready():
	for state_node in $States.get_children():
		_states_map[state_node.name] = state_node
		state_node.connect("finished", self, "change_state")
	
	change_state(INITIAL_STATE.get_name(INITIAL_STATE.get_name_count() - 1))


func _input(event):
	_current_state.handle_input(event)


func _physics_process(delta):
	_current_state.update(delta)


func change_state(state_name: String):
	if _current_state:
		_current_state.exit()
	
	_current_state = _states_map[state_name]
	_current_state.enter()
	
	emit_signal("state_changed", _current_state)
