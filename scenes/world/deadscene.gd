extends Node2D

var scene = ''

func _ready():
	$AudioStreamPlayer.play()
func _input(event):
	if Input.is_action_just_pressed("shoot"):
		match scene:
			"world":
				get_parent().get_parent().load_intro()
			"wormhole":
				get_parent().get_parent().wormhole_scene()
			"boss":
				get_parent().get_parent().boss_scene()


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()
