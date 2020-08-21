extends Control

onready var _game_menu = $GameMenu
onready var _player_health_ui: Label = $PlayerHealth
onready var _player_health: Node = MainWorld.get("Game/Player/Stats/Health")


func _ready():
	_on_Player_current_health_updated(_player_health.current_health)
	_player_health.connect("current_health_updated", self, "_on_Player_current_health_updated")


func _input(event):
	if event.is_action_pressed("pause"):
		_game_menu.visible = !_game_menu.visible
		get_tree().paused = _game_menu.visible


func _on_Player_current_health_updated(current_health: int):
	_player_health_ui.text = str(current_health) + " HP"
