extends Node2D

export(float) var move_speed = 2
export(float) var speed_varience = 0
var t
var from_point
var parent
var target
var speed

func _ready():
	randomize()
	parent = find_parent("*")
	_change_destination()
	
func _process(delta):
	if target == null || (parent.global_position - target.global_position).length() < 16:
		_change_destination()
	t += delta * speed
	parent.global_position = lerp(from_point, target.global_position, t)

func _change_destination():
	t = 0.0
	from_point = global_position
	_pick_target()
	_set_speed()

func _pick_target():
	var target_group = get_tree().get_nodes_in_group("critter")
	target = target_group[randi() % target_group.size()]

func _set_speed():
	if speed_varience == 0:
		speed = move_speed
	else:
		var variation = (randf() * (speed_varience * 2)) - speed_varience
		speed = move_speed + variation
