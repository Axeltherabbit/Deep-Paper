extends TextureRect

var numbers = {
			0:preload("res://assets/2D/0.png"),
			1:preload("res://assets/2D/1.png"),
			2:preload("res://assets/2D/2.png"),
			3:preload("res://assets/2D/3.png"),
			4:preload("res://assets/2D/4.png"),
			5:preload("res://assets/2D/5.png"),
			6:preload("res://assets/2D/6.png"),
			7:preload("res://assets/2D/7.png"),
			8:preload("res://assets/2D/8.png"),
			9:preload("res://assets/2D/9.png")}

func _ready():
	for child in $text.get_children():
		var t = numbers[0]
		child.set_texture(t)
	
	for child in $catkrencounter.get_children():
		var t = numbers[0]
		child.set_texture(t)

	var vptex = get_parent().get_node("Viewport").get_texture()
	texture = vptex

func _process(delta):
	if $text.is_visible():
		var dst = abs(get_parent().get_node("Viewport").get_child(0).distance)
		dst = min(dst,99999)
		dst = "%05d" % dst
		for i  in range(5):
			var t = numbers[int(dst[i])]
			$text.get_node(str(i)).set_texture(t)
	if $catkrencounter.is_visible():
		var life = abs(get_parent().get_node("Viewport").get_child(0).life)
		life = min(life,999)
		life = "%03d" % life
		for i  in range(3):
			var t = numbers[int(life[i])]
			$catkrencounter.get_node(str(i)).set_texture(t)
		
