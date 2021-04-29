extends KinematicBody


var lasertscn = preload("res://scenes/spaceship/laser.tscn")
onready var animatedtex =$MeshInstance.get_active_material(0).albedo_texture
var initanimationfinished: bool = false
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	initanimationfinished = false
	animatedtex.set_current_frame(0)
	set_process_input(initanimationfinished)

var mouse_sens : float = 0.3
var camera_anglev : float = 0

var cooling = false
var direction: Vector3 = Vector3()
var velocity: float = 0.0
var MAXSPEED: float = 50.0
func _input(event):
	direction = Vector3()
	direction -= self.global_transform.basis.z
	if Input.is_key_pressed(KEY_SPACE):
		velocity = lerp(velocity,MAXSPEED,0.1)
	else:
		velocity = lerp(velocity,0,0.1)

	if event is InputEventMouseMotion:
		rotate_object_local(Vector3(0,1,0),deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		camera_anglev+=changev
		rotate_object_local(Vector3(1,0,0),deg2rad(changev))
		
	if Input.is_action_pressed("shoot") and not cooling:
		if not $laseraudio.is_playing(): $laseraudio.play()
		var istc = lasertscn.instance()
		istc.transform = $bulletspawn.global_transform
		istc.velocity = istc.transform.basis.z * istc.speed
		istc.scale = Vector3(1,1,8)
		get_parent().add_child(istc)

func _process(delta):
	if not initanimationfinished and animatedtex.get_current_frame()+1 == animatedtex.frames:
		initanimationfinished = true
		$initaudio.stop()
		set_process_input(initanimationfinished)

func checkengines():
	if velocity < 1 :
		$leftengine.hide()
		$rightengine.hide()
	else:
		$leftengine.show()
		$rightengine.show()  
	
func _physics_process(delta):
	checkengines()
	move_and_slide(direction*velocity,Vector3.UP)

func die():
	var mainscene = get_parent().get_parent().get_parent()
	mainscene.dead_scene(get_parent())                                                                                                                                                                          


func _on_laseraudio_finished():
	$cooldown.start()
	cooling = true


func _on_cooldown_timeout():
	cooling = false
