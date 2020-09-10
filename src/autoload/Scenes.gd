extends Node

var _scenes: Dictionary = {
	# Main Menu
	"MainMenuGUI": preload("res://src/scenes/mainmenu/MainMenuGUI.tscn"),

	# Game
	"GameGUI": preload("res://src/scenes/game/GameGUI.tscn"),
	"GameWorld": preload("res://src/scenes/game/GameWorld.tscn"),

	# Game Over
	"GameOverGUI": preload("res://src/scenes/gameover/GameOverGUI.tscn"),

	# Finish
	"FinishGUI": preload("res://src/scenes/finish/FinishGUI.tscn"),
}


func load(scene: String) -> Node:
	return _scenes[scene].instance()
