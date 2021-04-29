extends Spatial


var distance = 0
var life = 999
func _process(delta):
	distance = ($catkren.transform.origin-$spaceship.transform.origin).length()
	life = $catkren.life
