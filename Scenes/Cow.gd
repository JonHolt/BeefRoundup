extends Sprite

export var pointValue = 1
const POINT_LABEL = preload("res://Scenes/PointValue.tscn")

func beamed(body):
	body.beam(pointValue)
	var label = POINT_LABEL.instance()
	label.points = pointValue
	label.rect_position = global_position
	get_tree().get_root().add_child(label)
	queue_free()
