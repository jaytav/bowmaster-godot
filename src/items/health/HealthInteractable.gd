extends Interactable

export (float) var _length
export (float) var _tick
export (int) var _health


func get_interacted_with(interactor: KinematicBody2D) -> void:
	var effect = EffectLoader.get_instance("HealthRegeneration", {
		"length": _length,
		"tick": _tick,
		"value": _health
	})
	
	interactor.apply_effect(effect)
	queue_free()
