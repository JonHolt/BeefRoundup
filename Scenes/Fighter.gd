extends Sprite

var parent

func _ready():
	parent = find_parent("*")

func _on_Area2D_body_entered(body):
	if body.is_in_group("UFO"):
		var _ok = get_tree().change_scene("res://Scenes/ScoreScreen.tscn")
