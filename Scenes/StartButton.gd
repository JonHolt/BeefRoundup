extends Button

func _ready():
	get_tree().paused = false

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Yard.tscn")
