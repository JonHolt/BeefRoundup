extends Label

func _ready():
	$Score.text = String(Global.score)
	$Pushes.text = String(Global.pushes)

func _on_Menu_pressed():
	var _ok = get_tree().change_scene("res://Scenes/menu.tscn")


func _on_NewGame_pressed():
	var _ok = get_tree().change_scene("res://Scenes/Yard.tscn")


func _on_Exit_pressed():
	get_tree().quit()
