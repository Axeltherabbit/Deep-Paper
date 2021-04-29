extends KinematicBody

var speed: int = 10
var velocity: Vector3 
func _physics_process(delta):
	var collision = move_and_collide(-velocity)
	if collision:
		var col_body = collision.get_collider()
		if col_body.is_in_group("enemy"):
			col_body.die()
		elif col_body.name == "catkrencollision":
			col_body.get_parent().hit()                  
		queue_free()



func _on_Timer_timeout():
	queue_free()
