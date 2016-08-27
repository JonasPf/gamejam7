
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.is_action_released("jump"):
		get_tree().change_scene("res://Scenes/Main_Level.tscn")
