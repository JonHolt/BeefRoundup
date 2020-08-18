extends Area2D

var parent

func _ready():
	parent = find_parent("*")

func _on_Beamable_body_entered(body):
	if body.is_in_group("UFO"):
		parent.beamed(body)
