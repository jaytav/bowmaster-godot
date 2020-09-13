extends Interactable

export (PackedScene) var _item

func get_interacted_with(interactor: KinematicBody2D) -> void:
	if _item:
		var item = _item.instance()
		item.position = get_global_position()
		MainWorld.add(item)
	
	queue_free()
