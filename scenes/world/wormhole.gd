extends Spatial


var tunnelmesh = preload("res://scenes/world/tunnelmesh.tscn")
var enemy = preload("res://scenes/world/enemy.tscn")



func _ready():
	for x in range(100):
		var ist = tunnelmesh.instance()
		ist.transform.origin-=Vector3(0,0,x*10)
		add_child(ist)
		if x>20 and x%5==0:
			ist = enemy.instance()
			ist.set_scale(Vector3(0.05,0.05,0.05))
			ist.move_speed = 0.5
			ist.transform.origin-=Vector3(0,0,x*10)
			add_child(ist)
			

var distance = 0
func _process(delta):
	distance = ($whitehole.transform.origin-$spaceship.transform.origin).length()



func _on_Area_body_entered(body):
	if body.name == "spaceship":
		call_deferred("nextscene")

func nextscene():
	get_parent().get_parent().boss_scene()
