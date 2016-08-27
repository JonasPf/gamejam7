
extends RayCast2D

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if is_colliding():
		if get_collider().is_in_group("player"):
			var player = get_node("../Player")
			player.restart()
