class_name Health
extends CapacityStat

signal depleted()


func take_damage(amount: int) -> void:
	popup_damage_text(amount)
	set_value(value - amount)
	
	if value == 0:
		emit_signal("depleted")


func heal(amount: int) -> void:
	popup_damage_text(amount)
	set_value(value + amount)


func popup_damage_text(amount: int):
	var popup = MainLoader.get_instance("src/Other/PopupText", {
		"initial_position": owner.get_global_position(),
		"value": str(amount),
		"time": 1
	})
	
	MainWorld.add(popup)
