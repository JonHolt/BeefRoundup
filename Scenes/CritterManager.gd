extends Timer

export(Array, Resource) var critter_types = []
export var MAX_CRITTERS = 100

var screen_size

func _ready():
	randomize()
	screen_size = get_viewport().size
	start()

func _on_CritterManager_timeout():
	if get_child_count() < MAX_CRITTERS:
		var critter = critter_types[_select_random_critter()].instance()
		critter.position.x = randi() % int(screen_size.x - 40) + 20
		critter.position.y = randi() % int(screen_size.y - 84) + 64
		add_child(critter)
		set_wait_time(randf() * 5)

func _select_random_critter():
	var percent = randi() % 101
	if percent <= 75:
		return 0 # Cow
	elif percent <= 80:
		return 1 # Chicken
	elif percent <= 85:
		return 2 # Pig
	else:
		return 0 # Catch-all to cow for now
