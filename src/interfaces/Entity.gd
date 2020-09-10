tool
class_name Entity
extends KinematicBody2D
"""
Entity are a game object which contains Stats, Effects and StateMachine nodes
"""

export (bool) var _show_debug = false setget set_show_debug

onready var state_machine: StateMachine = $StateMachine
onready var _ui_state_machine_debug_state: Label = $EntityUI/StateMachineDebug/State
onready var _effects: Node = $Effects


func apply_effect(effect: Node) -> void:
	if !effect.can_apply(self):
		return
	
	_effects.add_child(effect)


func set_show_debug(show_debug: bool) -> void:
	_show_debug = show_debug
	
	if has_node("EntityUI/StateMachineDebug"):
		$EntityUI/StateMachineDebug.visible = _show_debug


func _on_StateMachine_transitioned(state: State) -> void:
	_ui_state_machine_debug_state.text = state.name
