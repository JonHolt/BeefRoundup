extends Label

signal time_up
signal increment

export var countdown = true
export var time_seconds = 300.0
export var change_increment = 30
var time_left
var last_increment

func _ready():
	reset()

func reset():
	time_left = time_seconds
	last_increment = time_left

func _process(delta):
	if countdown:
		time_left -= delta
		if time_left <= 0:
			emit_signal("time_up")
	else:
		time_left += delta
	
	if int(time_left) % change_increment == 0 && int(time_left) != last_increment:
		emit_signal("increment")
		last_increment = int(time_left)
	text = _output_format()

func _output_format():
	var digit_format = "%02d"
	var trunc = int(time_left)
	var minutes = trunc / 60
	var seconds = trunc % 60
	return digit_format % minutes + ":" + digit_format % seconds
