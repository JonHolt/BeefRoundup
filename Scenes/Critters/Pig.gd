extends Sprite

export var pointValue = 2

func beamed(body):
	body.beam(pointValue)
	queue_free()
