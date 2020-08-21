extends Control

func _on_StartButton_pressed():
	MainGUI.clear()
	MainWorld.add(Scenes.GameWorld)
	MainGUI.add(Scenes.GameGUI)
