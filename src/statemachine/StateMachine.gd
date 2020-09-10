class_name StateMachine
extends Node

signal transitioned(state)

export (NodePath) var initial_state

onready var state: State = get_node(initial_state)


func _init() -> void:
	add_to_group("state_machine")


func _ready() -> void:
	yield(owner, "ready")
	
	if !initial_state:
		push_error("StateMachine.initial_state not initialised")
	
	state.enter()
	emit_signal("transitioned", state)


func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input(event)


func _physics_process(delta: float) -> void:
	state.physics_process(delta)


func transition_to(target_state_path: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		return
	
	state.exit()
	state = get_node(target_state_path)
	state.enter(msg)
	emit_signal("transitioned", state)
