extends RigidBody2D

const JUMP_FORCE = Vector2(0, -3000)
const INITIAL_FORCE = Vector2(100, 0)
const NULL_VECTOR = Vector2(0, 0)

func _ready():
	self.add_force(NULL_VECTOR, INITIAL_FORCE)
	set_fixed_process(true)
	get_node("SamplePlayer").play("boar_gruntqueal")

func _fixed_process(delta):
	var grounds = get_tree().get_nodes_in_group("grounds")
	var enemies = get_tree().get_nodes_in_group("enemies")
	
	var on_ground = false
	for c in get_colliding_bodies():
		if c in grounds:
			on_ground = true
		elif c in enemies:
			c.set_hit()
	
	if Input.is_action_pressed("jump") and on_ground:
		self.apply_impulse(NULL_VECTOR, JUMP_FORCE * delta)
		get_node("SamplePlayer").play("boar_gruntqueal")
