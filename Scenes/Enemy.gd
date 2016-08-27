
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var hit = false
var disappear_counter = 2

func set_hit():
	set_mode(MODE_RIGID)
	hit = true
	apply_impulse(Vector2(0,0), Vector2(15,-4))

func _process(delta):
	if hit:
		disappear_counter -= delta

	if disappear_counter < 0:
		free()

func _ready():
	set_process(true)