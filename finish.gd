extends RayCast2D

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if is_colliding():
		get_tree().change_scene("res://Scenes/Intro.tscn")

