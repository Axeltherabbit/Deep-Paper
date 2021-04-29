extends Node2D


func _input(event):
	if Input.is_action_just_pressed("shoot"):
		set_process_input(false)
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		get_parent().get_parent().load_menu()

