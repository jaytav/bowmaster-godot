extends Interactable

export (int) var _health


func get_interacted_with(interactor: KinematicBody2D):
	if interactor.has_node("Stats/Health"):
		var interactor_health = interactor.get_node("Stats/Health")
		interactor_health.heal(_health)
		queue_free()
