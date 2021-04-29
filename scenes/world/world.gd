extends Spatial



var distance = 0
func _process(delta):
	distance = ($paperhole.transform.origin-$spaceship.transform.origin).length()


func _on_Area_body_entered(body):
	if body.name == "spaceship":
		call_deferred("nextscene")
		
func nextscene():
	get_parent().get_parent().wormhole_scene()
