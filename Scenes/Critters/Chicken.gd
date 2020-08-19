extends Sprite

export var pointValue = 5

func beamed(body):
	body.beam(pointValue)
	queue_free()
