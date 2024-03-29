extends State

export (float) var _max_speed
export (float) var _idle_wait_time

onready var _timer: Timer = $Timer


func enter(msg: Dictionary = {}) -> void:
	_timer.start(_idle_wait_time)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	parent.max_speed = _max_speed


func exit() -> void:
	_timer.disconnect("timeout", self, "_on_Timer_timeout")


func _on_Timer_timeout() -> void:
	state_machine.transition_to("Move/Fly")
