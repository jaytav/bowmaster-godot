extends Node2D

func _on_Hitbox_body_entered(body):
	MainWorld.clear()
	MainGUI.clear()
	MainGUI.add(Scenes.FinishGUI)
