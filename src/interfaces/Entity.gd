tool
class_name Entity
extends KinematicBody2D
"""
Entity are a game object which contains Stats and StateMachine nodes
"""

export (bool) var _show_debug = false setget set_show_debug

onready var state_machine: StateMachine = $StateMachine
onready var _ui_state_machine_debug_state = $EntityUI/StateMachineDebug/State
onready var _effects = $Effects


func apply_effect(effect: Node) :
	if !effect.can_apply(self):
		return
	
	_effects.add_child(effect)


func set_show_debug(show_debug: bool):
	_show_debug = show_debug
	
	if has_node("EntityUI/StateMachineDebug"):
		$EntityUI/StateMachineDebug.visible = _show_debug


func _on_StateMachine_transitioned(state):
	_ui_state_machine_debug_state.text = state.name
