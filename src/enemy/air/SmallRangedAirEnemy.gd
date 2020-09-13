tool
class_name SmallRangedAirEnemy
extends SmallAirEnemy

onready var _follow_state: State = $StateMachine/Move/Follow
onready var _weapon: RangedWeapon = $Weapon


func _on_StateMachine_transitioned(state: State) -> void:
	._on_StateMachine_transitioned(state)
	
	if state.name != "Follow":
		_weapon.target = null
		return
	
	_weapon.target = _follow_state.target 
