extends Timer

export(Array, Resource) var critter_types = []
export (Resource) var fighter
export var MAX_CRITTERS = 100

var screen_size
var player

func _ready():
	player = get_tree().get_nodes_in_group("UFO")[0]
	randomize()
	screen_size = get_viewport().size
	for i in 5:
		_on_CritterManager_timeout()
	start()

func _on_CritterManager_timeout():
	if get_child_count() < MAX_CRITTERS:
		var critter = critter_types[_select_random_critter()].instance()
		var pos = _random_position()
		while (pos - player.global_position).length() < 50:
			pos = _random_position()
		critter.global_position = pos
		add_child(critter)
		set_wait_time(randf() * 5)

func _random_position():
	var x = randi() % int(screen_size.x - 40) + 20
	var y = randi() % int(screen_size.y - 84) + 64
	return Vector2(x, y)

func _select_random_critter():
	var percent = randi() % 101
	if percent <= 75:
		return 0 # Cow
	elif percent <= 80:
		return 1 # Chicken
	elif percent <= 85:
		return 2 # Pig
	elif percent <= 90:
		return 3 # Cat
	elif percent <= 95:
		return 4 # Dog
	else:
		return 0 # Catch-all to cow for now

func spawn_fighter():
	var iFighter = fighter.instance()
	iFighter.global_position = Vector2(1500, 300)
	add_child(iFighter)

func _on_Timer_time_up():
	get_tree().change_scene("res://Scenes/ScoreScreen.tscn")


func _on_Timer_increment():
	$Farmer/Chaser.move_speed += 5
