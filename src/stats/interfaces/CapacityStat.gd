class_name CapacityStat
extends Stat

export (int) var max_value


func _ready() -> void:
	if !initial_value:
		self.value = max_value


func set_value(new_value: int) -> void:
	.set_value(clamp(new_value, 0, max_value))
