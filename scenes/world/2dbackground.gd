extends Node2D

onready var viewport = get_node("Viewport")

var menu = preload("res://scenes/introduction/menu.tscn")
var intro = preload("res://scenes/introduction/introduction.tscn")
var world = preload("res://scenes/world/world.tscn")
var dead = preload("res://scenes/world/deadscene.tscn")
var wormhole = preload("res://scenes/world/wormhole.tscn")
var boss = preload("res://scenes/catkren/boss.tscn")
var won = preload("res://scenes/catkren/won.tscn")
func _ready():
	set_process_input(true)
	load_menu()

func _input(event):
	viewport.input(event)

#func _unhandled_input(event):
#	viewport.input(event)
	
func clear_vp():
	for child in viewport.get_children(): 
		viewport.remove_child(child)
		child.queue_free()
	
func show_dst():
	$vpbackground/text.show()
	$vpbackground/distancelabel.show()

func hide_dst():
	$vpbackground/text.hide()
	$vpbackground/distancelabel.hide()

func show_catkren():
	$vpbackground/catkrencounter.show()
	$vpbackground/catkrenlabel.show()

func hide_catkren():
	$vpbackground/catkrencounter.hide()
	$vpbackground/catkrenlabel.hide()

func load_menu():
	set_process_input(false)
	clear_vp()
	hide_dst()
	hide_catkren()
	viewport.add_child(menu.instance())
	set_process_input(true)
	
func load_intro():
	set_process_input(false)
	clear_vp()
	hide_dst()
	hide_catkren()
	viewport.add_child(intro.instance())
	set_process_input(true)

func start_world():
	set_process_input(false)
	clear_vp()
	hide_catkren()
	viewport.add_child(world.instance())
	show_dst()
	set_process_input(true)
	
func dead_scene(scene):
	set_process_input(false)
	hide_dst()
	hide_catkren()
	clear_vp()
	var istc = dead.instance()
	istc.scene = scene.name
	viewport.add_child(istc)
	set_process_input(true)
			
func wormhole_scene():
	set_process_input(false)
	hide_dst()
	hide_catkren()
	clear_vp()
	viewport.add_child(wormhole.instance())
	show_dst()
	set_process_input(true)
func boss_scene():
	set_process_input(false)
	hide_dst()
	hide_catkren()
	clear_vp()
	viewport.add_child(boss.instance())
	show_dst()
	show_catkren()
	set_process_input(true)
	
func won_scene():
	set_process_input(false)
	hide_dst()
	hide_catkren()
	clear_vp()
	viewport.add_child(won.instance())
	set_process_input(true)
	
