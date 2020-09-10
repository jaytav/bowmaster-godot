extends Interactable

export (float) var _length
export (float) var _tick
export (int) var _health


func get_interacted_with(interactor: KinematicBody2D):
	var effect = EffectLoader.get("HealthRegeneration")
	effect.length = _length
	effect.tick = _tick
	effect.value = _health
	interactor.apply_effect(effect)
	queue_free()
