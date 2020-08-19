extends Timer

export var move_speed = .2
export var max_distance = 100
export var max_wait_time = 10.0
export var min_wait_time = 2.0

var parent
var destination
var screen_size
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	screen_size = get_viewport().size
	parent = find_parent("*")
	set_wait_time(rng.randf_range(min_wait_time, max_wait_time))
	start()

func _process(delta):
	if destination != null:
		parent.position = lerp(parent.position, destination, move_speed * delta)
		if (parent.position - destination).length() < 2:
			destination = null
			set_wait_time(rng.randf_range(min_wait_time, max_wait_time))
			start()

func _on_Wanderable_timeout():
	_new_destination()

func _new_destination():
	var x = clamp(rng.randi_range(max_distance * -1, max_distance) + parent.global_position.x, 20, screen_size.x - 20)
	var y = clamp(rng.randi_range(max_distance * -1, max_distance) + parent.global_position.y, 64, screen_size.y - 20)
	destination = Vector2(x, y)
