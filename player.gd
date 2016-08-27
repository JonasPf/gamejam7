extends RigidBody2D

const JUMP_FORCE = Vector2(0, -3000)
const INITIAL_FORCE = Vector2(100, 0)
const NULL_VECTOR = Vector2(0, 0)

var jumping = true

func _ready():
	self.add_force(NULL_VECTOR, INITIAL_FORCE)
	set_fixed_process(true)
	
func _integrate_forces(state):
	pass
	
func _fixed_process(delta):
	if Input.is_action_pressed("jump") and not jumping:
		self.apply_impulse(NULL_VECTOR, JUMP_FORCE * delta)
		jumping = true

	if get_colliding_bodies().size() > 0:
		print("Collision")
		jumping = false
	

