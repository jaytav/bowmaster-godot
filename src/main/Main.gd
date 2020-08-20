
extends Node

func _ready():
	MainGUI.init(get_node("GUI"))
	MainWorld.init(get_node("World"))
	MainGUI.add(Scenes.MainMenuGUI)
