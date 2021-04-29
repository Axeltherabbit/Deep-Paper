extends MeshInstance

var enemy = preload("res://scenes/world/enemy.tscn")

export var spawntime: int = 5

func _ready():
	$Timer.set_wait_time(spawntime)

func _on_Timer_timeout():
	var istc = enemy.instance()
	istc.transform.origin = self.transform.origin
	istc.move_speed = 1.0                 
	get_parent().add_child(istc)
