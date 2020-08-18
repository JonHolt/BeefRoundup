extends Sprite

func show():
	visible = true
	$Timer.start()


func _on_Timer_timeout():
	visible = false
