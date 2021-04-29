extends Node2D


var c=1
func _input(event):
	if Input.is_action_just_pressed("shoot"):
		get_node("dialog"+str(c)).hide()
		c+=1
		if c==4:
			var vp = get_parent()
			vp.get_parent().start_world()

