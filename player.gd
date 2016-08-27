extends RigidBody2D

const JUMP_FORCE = Vector2(0, -900)
const INITIAL_FORCE = Vector2(100, 0)
const NULL_VECTOR = Vector2(0, 0)

func _ready():
	self.add_force(NULL_VECTOR, INITIAL_FORCE)
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_action_pressed("jump"):
		self.add_force(NULL_VECTOR, JUMP_FORCE * delta)


