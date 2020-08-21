class_name Interactor
extends Area2D

var _interactable: Interactable


func _input(event):
	if event.is_action_pressed("interact"):
		if _interactable:
			_interactable.get_interacted_with(owner)
		else:
			print("Failed to interact. No interactables in range")


func _on_Interactor_area_entered(area):
	if _interactable != null:
		_interactable.unhighlight()
		
	_interactable = area.get_parent()
	_interactable.highlight()


func _on_Interactor_area_exited(area):
	# skip on_area_exit if not exiting current _interactable
	if area.get_parent().get_instance_id() != _interactable.get_instance_id():
		return

	_interactable.unhighlight()
	_assign_next_interactable()


# Gets next overlapping interactable, otherwise set null
func _assign_next_interactable():
	for area in get_overlapping_areas():
		var interactable = area.get_parent()
		if interactable.get_instance_id() != _interactable.get_instance_id():
			_interactable = interactable
			_interactable.highlight()
			return

	_interactable = null
