extends Sprite

export var pointValue = 1

func beamed(body):
	body.beam(pointValue)
	queue_free()
