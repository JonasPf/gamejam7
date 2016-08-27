extends RigidBody2D

#const JUMP_FORCE = Vector2(0, -3000)
const INITIAL_FORCE = Vector2(100, 0)
const NULL_VECTOR = Vector2(0, 0)

var player
var feet
var velocity_increase = 10
var jump_height = 600
var velocity = 350
var detect_right
var detect_left
var detect_up
var charging = false
var started = false
var start_charging = false

func _ready():
#	self.add_force(NULL_VECTOR, INITIAL_FORCE)
	set_fixed_process(true)
	set_process_input(true)
	
	feet = get_node('Feet')
	detect_right = get_node('Right')
	detect_left = get_node('Left')
	detect_up = get_node('Up')
	feet.add_exception(self)
	detect_right.add_exception(self)
	detect_left.add_exception(self)
	detect_up.add_exception(self)

	get_node("Player_Anim").play("Idle")

func _input(event):
	if not started and event.type == InputEvent.KEY:
		intro()

func intro():
	started = true
	get_node("Scene_Anim").play("Start")
	get_node("Player_Anim").play("Epic")
	get_node("TextControls").hide()
	get_node("TextPressAny").hide()
	get_node("TextTitle").hide()
	get_node("SamplePlayer").play("goblin_battlecry")

func start_game():
	set_mode(MODE_RIGID)
	get_node("Player_Anim").play("Run")

func victory():
	get_node("TextVictory").show()
	get_node("SamplePlayer").play("charge_trumpet_perhaps")

#	get_node("Player_Anim").play("Epic")
#	velocity = 0

func restart():
	get_tree().reload_current_scene()

func detect_collision():
	if detect_right.is_colliding() || detect_left.is_colliding() || detect_up.is_colliding():
		var obj = detect_right.get_collider()
		
		if obj == null:
			obj = detect_left.get_collider()
		if obj == null:
			obj = detect_up.get_collider()
		
		if obj.is_in_group("enemies"):
			if charging:
				obj.set_hit()
				velocity += velocity_increase
			else:
				die()
		elif obj.is_in_group("grounds"):
			die()

func die():
	get_tree().reload_current_scene()
#		get_tree().change_scene("res://Scenes/Intro.tscn")

func start_charge():
	charging = true
	get_node("SpeechBubble").show()

func stop_charge():
	charging = false
	get_node("SpeechBubble").hide()

func _fixed_process(delta):
	set_axis_velocity(Vector2(velocity,0))

	detect_collision()

	if not start_charging and Input.is_action_pressed("charge"):
		start_charging = true
		get_node("Player_Anim").play("to_charge")

	if feet.is_colliding():
#		get_node("SamplePlayer").play("gallop_loop", true)
		if Input.is_action_pressed("jump"):
			set_axis_velocity(Vector2(0,-jump_height))
			get_node("SamplePlayer").play("boar_gruntsqueal")
