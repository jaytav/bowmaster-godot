extends Control

onready var _game_menu = $GameMenu


func _input(event):
	if event.is_action_pressed("pause"):
		_game_menu.visible = !_game_menu.visible
		get_tree().pause(_game_menu.visible)
