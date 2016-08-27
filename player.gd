
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var jump_force = -100

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.add_force(Vector2(0,0), Vector2(10, 0))
	
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	if Input.is_action_pressed("jump"):
		self.add_force(Vector2(0,0), Vector2(0, jump_force) * delta)


