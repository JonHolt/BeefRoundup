extends CanvasLayer

signal unpause()

func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Resume_pressed():
	emit_signal("unpause")
