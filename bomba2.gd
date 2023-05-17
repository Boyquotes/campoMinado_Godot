extends Area2D

var timer
var dentro

func _ready():
	get_node("/root/Node2D/Bomba2").body_entered.connect(_on_Area2D_body_enter)
	get_node("/root/Node2D/Bomba2").body_exited.connect(_on_Area2D_body_exit)

func _on_Area2D_body_enter( body ):
	print("Entrou BOMBA 2 ")
	
	dentro = true
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.connect("timeout", _on_Timer_timeout)
	timer.start()
	

func _on_Timer_timeout() -> void:
	var node = get_node("/root/Node2D/Bomba2/Sprite2D")
	node.visible = true 
	var new_texture = load("res://explosao.png") 
	node.set_texture(new_texture)
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.connect("timeout", _on_Timer_timeout2)
	timer.start()
	
	if dentro:
		get_tree().quit()
	else:
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = 1.0
		timer.one_shot = true
		timer.connect("timeout", _on_Timer_deleteBomb)
		timer.start()
		

func _on_Timer_deleteBomb() -> void:
	var bomb = get_node("/root/Node2D/Bomba2")
	bomb.queue_free()

func _on_Timer_timeout2() -> void:
	var node = get_node("/root/Node2D/Bomba2/Sprite2D")
	node.visible = false 


func _on_Area2D_body_exit( body ):
	dentro = false
	print("Saiu BOMBA 2 ")

