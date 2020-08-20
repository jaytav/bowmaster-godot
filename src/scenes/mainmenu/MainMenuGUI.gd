extends Control

func _on_StartButton_pressed():
	MainGUI.clear()
	MainGUI.add(Scenes.GameGUI)
	MainWorld.add(Scenes.GameWorld)
