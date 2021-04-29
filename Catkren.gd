extends Sprite3D


var life: int = 100

func _ready():
	for c in range(1,5):
		get_node("tentacle0"+str(c)).get_node("AnimationPlayer").play("tentacle0"+str(c))
	$AnimationPlayer.play("movement")

func hit():
	life-=1
	print(life)
	if life<=0:
		get_parent().get_parent().get_parent().won_scene()
