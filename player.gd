extends RigidBody2D

const JUMP_FORCE = Vector2(0, -3000)
const INITIAL_FORCE = Vector2(100, 0)
const NULL_VECTOR = Vector2(0, 0)

var player
var feet
var jump_height = 300
var velocity = 150
var detect_right
var detect_left
var detect_up

func _ready():
#	self.add_force(NULL_VECTOR, INITIAL_FORCE)
	set_fixed_process(true)
	get_node("SamplePlayer").play("goblin_battlecry")
	
	feet = get_node('Feet')
	detect_right = get_node('Right')
	detect_left = get_node('Left')
	detect_up = get_node('Up')
	feet.add_exception(self)
	detect_right.add_exception(self)
	detect_left.add_exception(self)
	detect_up.add_exception(self)

func detect_game_over():
	if detect_right.is_colliding() || detect_left.is_colliding() || detect_up.is_colliding():
		print("detect_right!")
		get_tree().change_scene("res://Scenes/Intro.tscn")

func _fixed_process(delta):
	set_axis_velocity(Vector2(velocity,0))

	detect_game_over()

	
	var grounds = get_tree().get_nodes_in_group("grounds")
	var enemies = get_tree().get_nodes_in_group("enemies")
	
	var on_ground = false
	for c in get_colliding_bodies():
		if c in grounds:
			on_ground = true
		elif c in enemies:
			c.set_hit()

	if Input.is_action_pressed("charge"):
		self.apply_impulse(NULL_VECTOR, NULL_VECTOR)

	if feet.is_colliding():
		if Input.is_action_pressed("jump"):
			set_axis_velocity(Vector2(0,-jump_height))
			self.apply_impulse(NULL_VECTOR, JUMP_FORCE * delta)


	
#	if Input.is_action_pressed("jump") and on_ground:
#		self.apply_impulse(NULL_VECTOR, JUMP_FORCE * delta)
#		get_node("SamplePlayer").play("boar_gruntqueal")
