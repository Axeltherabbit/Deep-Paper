extends KinematicBody

onready var spaceship = get_parent().get_node("spaceship")
var move_speed : float = 3.5
func _physics_process(delta):
	var collision = move_and_collide((spaceship.get_global_transform().origin- self.get_global_transform().origin).normalized() * move_speed)
	if collision:
		var col_body = collision.get_collider()
		if col_body.name == "spaceship":
			col_body.die()
func _ready():
	$sprite/AnimationPlayer.play("movement")

func die():
	queue_free()
