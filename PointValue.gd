extends Label

export var points = 1

func _ready():
	if points >= 0:
		text = "+" + String(points)
		set("custom_colors/font_color", Color(0, 1, 0))
	else:
		text = String(points)
		set("custom_colors/font_color", Color(1, 0, 0))
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
