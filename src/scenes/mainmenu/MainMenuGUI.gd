extends Control

func _on_StartButton_pressed() -> void:
	MainGUI.clear()
	MainWorld.add(Scenes.load("GameWorld"))
	MainGUI.add(Scenes.load("GameGUI"))
