extends RigidBody2D

const JUMP_FORCE = Vector2(0, -3000)
const INITIAL_FORCE = Vector2(100, 0)
const NULL_VECTOR = Vector2(0, 0)

func _ready():
	self.add_force(NULL_VECTOR, INITIAL_FORCE)
	set_fixed_process(true)
	
func _fixed_process(delta):
	var on_ground = get_colliding_bodies().size() > 0
	
	if Input.is_action_pressed("jump") and on_ground:
		self.apply_impulse(NULL_VECTOR, JUMP_FORCE * delta)

	

