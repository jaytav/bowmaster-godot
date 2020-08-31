extends Control

func _on_StartButton_pressed():
	MainGUI.clear()
	MainWorld.add(Scenes.load("GameWorld"))
	MainGUI.add(Scenes.load("GameGUI"))
