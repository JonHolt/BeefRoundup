extends Node2D

export(float) var move_speed = 2
export(float) var speed_varience = 0
export var chase_player = false
var player
var t
var from_point
var parent
var target
var speed

func _ready():
	randomize()
	parent = find_parent("*")
	_change_destination()
	player = get_tree().get_nodes_in_group("UFO")[0]
	
func _process(delta):
	if target == null || (parent.global_position - target.global_position).length() < 16:
		_change_destination()
	var new_pos = _find_new_pos(target.global_position, delta)
	if new_pos.x - parent.global_position.x < 0:
		parent.set_flip_h(false)
	else:
		parent.set_flip_h(true) 
	parent.global_position = new_pos

func _change_destination():
	t = 0.0
	from_point = global_position
	_pick_target()
	_set_speed()

func _pick_target():
	if chase_player:
		target = player
		return
	var target_group = get_tree().get_nodes_in_group("critter")
	target = target_group[randi() % target_group.size()]

func _set_speed():
	if speed_varience == 0:
		speed = move_speed
	else:
		var variation = (randf() * (speed_varience * 2)) - speed_varience
		speed = move_speed + variation

func _find_new_pos(target_pos, delta):
	var difference = target_pos - parent.global_position
	var direction = difference.normalized()
	var distance = min(delta * speed, difference.length())
	var movement = direction * distance
	return parent.global_position + movement
