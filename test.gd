extends Area2D


func _on_test_input_event(viewport, event, shape_idx):
	print("input")
	if Input.is_action_just_pressed("click"):
		print("click!")
