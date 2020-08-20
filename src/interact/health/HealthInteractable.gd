extends Interactable

export (int) var _health

func get_interacted_with(interactor: Area2D):
	interactor.get_parent().heal(_health)
	.get_interacted_with(interactor)
