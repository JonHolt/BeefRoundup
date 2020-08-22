extends Sprite

export var pointValue = -10
const POINT_LABEL = preload("res://Scenes/PointValue.tscn")
var screen_height
var player
var times_beamed = 0
var angry = false
var ragePhrases = [
	"Aliens are real!",
	"I've been microchipped!",
	"I have seen the other side!",
	"This time I got proof!",
	"So that's where my cows go..."
]

func _ready():
	player = get_tree().get_nodes_in_group("UFO")[0]
	screen_height = get_viewport().size.y - 60

func beamed(body):
	if !visible || angry:
		return
	# Send the points
	body.beam(pointValue)
	# Show the label
	var label = POINT_LABEL.instance()
	label.points = pointValue
	label.rect_position = global_position
	get_tree().get_root().add_child(label)
	# Hide for a bit
	visible = false
	$DeathTimer.start()
	# Hold a grudge
	times_beamed += 1
	if times_beamed >= 5:
		find_parent("CritterManager").spawn_fighter()

func _on_DeathTimer_timeout():
	global_position = player.global_position
	global_position.y =	clamp(global_position.y + 60, 0, screen_height)
	visible = true
	angry = true
	$RageBubble.text = ragePhrases[randi() % ragePhrases.size()]
	$RageBubble.visible = true
	$RebirthTimer.start()


func _on_RebirthTimer_timeout():
	angry = false
	$RageBubble.visible = false
