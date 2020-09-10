class_name ReplenishStat
extends CapacityStat

export (float) var _replenish_time
export (int) var _replenish_amount

var _timer: Timer


func _ready() -> void:
	_timer = Timer.new()
	_timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(_timer)
	._ready()


func set_value(new_value: int) -> void:
	.set_value(new_value)
	
	if _timer:
		if new_value < max_value:
			_timer.start(_replenish_time)
		else:
			_timer.stop()
	


func _on_Timer_timeout() -> void:
	self.value += _replenish_amount
