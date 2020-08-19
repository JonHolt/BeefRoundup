extends Node2D

export(float) var move_speed = 2
export(float) var speed_varience = 0
var parent
var target
var speed

func _ready():
	randomize()
	parent = find_parent("*")
	_pick_target()
	_set_speed()
	
func _process(delta):
	if target == null || (parent.global_position - target.global_position).length() < 16:
		_pick_target()
		_set_speed()
	parent.global_position = lerp(parent.global_position, target.global_position, speed * delta)

func _pick_target():
	var target_group = get_tree().get_nodes_in_group("critter")
	target = target_group[randi() % target_group.size()]
	print(target)

func _set_speed():
	if speed_varience == 0:
		speed = move_speed
	else:
		var variation = (randf() * (speed_varience * 2)) - speed_varience
		speed = move_speed + variation
