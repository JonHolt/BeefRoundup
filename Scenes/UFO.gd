extends RigidBody2D

signal score_changed(newScore)
signal impulse_changed(impulses)

var selected = false
var point_total = 0
var impulses = 0

func _ready():
	Global.score = 0
	Global.pushes = 0

func _process(_delta):
	if selected:
		$FlickVector.clear_points()
		$FlickVector.add_point(Vector2(0,0))
		$FlickVector.add_point(get_global_mouse_position() - global_position)

func _input(_event):
	if Input.is_action_just_pressed("click"):
		selected = true
	if Input.is_action_just_released("click") && selected:
		selected = false
		$FlickVector.clear_points()
		launch()

func launch():
	impulses += 1
	emit_signal("impulse_changed", impulses)
	Global.pushes = impulses
	var push = global_position - get_global_mouse_position()
	apply_central_impulse(push)

func beam(points):
	point_total += points
	emit_signal("score_changed", point_total)
	Global.score = point_total
	$Beam.show()
	$SoundBeam.play()
