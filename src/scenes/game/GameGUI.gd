extends Control

onready var _game_menu = $GameMenu

# Health
onready var _player_health_ui: Label = $PlayerHealth
onready var _player_health: Node = MainWorld.get("Game/Player/Stats/Health")

# Ammo
onready var _player_ammo_ui: Label = $PlayerAmmo
onready var _player_ammo: Node = MainWorld.get("Game/Player/Stats/Ammo")


func _ready():
	# Health
	_on_Player_current_health_updated(_player_health.current_health)
	_player_health.connect("current_health_updated", self, "_on_Player_current_health_updated")
	
	# Ammo
	_on_Player_current_ammo_uupdated(_player_ammo.current_ammo)
	_player_ammo.connect("current_ammo_updated", self, "_on_Player_current_ammo_uupdated")


func _input(event):
	if event.is_action_pressed("pause"):
		_game_menu.visible = !_game_menu.visible
		get_tree().paused = _game_menu.visible


func _on_Player_current_health_updated(current_health: int):
	_player_health_ui.text = str(current_health) + " / " + str(_player_health.max_health)


func _on_Player_current_ammo_uupdated(current_ammo: int):
	_player_ammo_ui.text = str(current_ammo)
