extends Control

onready var _game_menu = $GameMenu

# Stats
onready var _player_stats = MainWorld.get("Game/Player/Stats")

# Health
onready var _player_health_ui: Label = $PlayerHealth
onready var _player_health = _player_stats.get_node("Health")

# Ammo
onready var _player_ammo_ui: Label = $PlayerAmmo
onready var _player_ammo: Node = MainWorld.get("Game/Player/Stats/Ammo")


func _ready():
	# Health
	_on_Player_health_updated(_player_health.value)
	_player_health.connect("value_updated", self, "_on_Player_health_updated")
	
	# Ammo
	_on_Player_ammo_updated(_player_ammo.value)
	_player_ammo.connect("value_updated", self, "_on_Player_ammo_updated")


func _input(event):
	if event.is_action_pressed("pause"):
		_game_menu.visible = !_game_menu.visible
		get_tree().paused = _game_menu.visible


func _on_Player_health_updated(value: int):
	_player_health_ui.text = str(value) + " / " + str(_player_health.max_value)


func _on_Player_ammo_updated(value: int):
	_player_ammo_ui.text = str(value) + " / " + str(_player_ammo.max_value)
