
extends RigidBody2D

var player
var feet
var jump_height = 300
var velocity = 150
var detect_right
var detect_left
var detect_up

func _ready():
	set_process(true)
	feet = get_node('Feet')
	detect_right = get_node('Right')
	detect_left = get_node('Left')
	detect_up = get_node('Up')
	feet.add_exception(self)
	detect_right.add_exception(self)
	detect_left.add_exception(self)
	detect_up.add_exception(self)
	
	#set_mode(2)

func detect_game_over():
	if detect_right.is_colliding() || detect_left.is_colliding() || detect_up.is_colliding():
		print("detect_right!")
		get_tree().change_scene("res://tests/new_player.tscn")

func _process(delta):
	set_axis_velocity(Vector2(velocity,0))
	detect_game_over()
	
	
	if feet.is_colliding():
			
		if Input.is_action_pressed("jump"):
			set_axis_velocity(Vector2(0,-jump_height))
	
		#if Input.is_action_pressed("ui_right"):
		#	set_axis_velocity(Vector2(velocity,0))
		
		#if Input.is_action_pressed("ui_left"):
		#	set_axis_velocity(Vector2(-velocity,0))
	
	#var transform = get_transform()
	#var rotation = transform.get_rotation()
	#var max_rotation = transform.rotated(PI/3)
	#if rotation > max_rotation:
	#	set_transform(max_rotation)
		
	#print(rotation)