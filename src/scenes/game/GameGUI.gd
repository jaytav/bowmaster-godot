extends Control

onready var _game_menu = $GameMenu

# Stats
onready var _player_stats: Node = MainWorld.get("Game/Player/Stats")

# Health
onready var _player_health_ui: Label = $PlayerHealth
onready var _player_health: Health = _player_stats.get_node("Health")

# Ammo
onready var _player_ammo_ui: Label = $PlayerAmmo
onready var _player_ammo: Ammo = _player_stats.get_node("Ammo")


func _ready() -> void:
	# Health
	_on_Player_health_updated(_player_health.value)
	_player_health.connect("value_updated", self, "_on_Player_health_updated")
	
	# Ammo
	_on_Player_ammo_updated(_player_ammo.value)
	_player_ammo.connect("value_updated", self, "_on_Player_ammo_updated")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_game_menu.visible = !_game_menu.visible
		get_tree().paused = _game_menu.visible


func _on_Player_health_updated(value: int) -> void:
	_player_health_ui.text = str(value) + " / " + str(_player_health.max_value)


func _on_Player_ammo_updated(value: int) -> void:
	_player_ammo_ui.text = str(value) + " / " + str(_player_ammo.max_value)
