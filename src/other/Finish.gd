extends Area2D


func _on_Finish_body_entered(body):
	MainWorld.clear()
	MainGUI.clear()
	MainGUI.add(Scenes.FinishGUI)
