extends Node2D

var menu = load("res://Scenes/PauseMenu.tscn")

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		if get_tree().paused == true:
			var menu_el = menu.instance()
			add_child(menu_el)
			menu_el.connect("unpause", self, "_unpause")
		else:
			get_node("PauseMenu").queue_free()

func _unpause():
	get_tree().paused = false
	get_node("PauseMenu").queue_free()
