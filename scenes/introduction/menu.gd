extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Button_pressed():
	get_parent().get_parent().load_intro()


func _on_Timer_timeout():
	$Button.show() #nice crap
	
var mouse_pos = Vector2()
func _input(event):
	if event is InputEventMouseMotion:
		var pos = event.position
		pos.y *=-1
		pos.y += 200
		pos.x +=1024/2
		mouse_pos = pos


func _process(delta):
	$pawn.set_position(mouse_pos)
