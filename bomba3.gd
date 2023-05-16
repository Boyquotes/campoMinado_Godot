extends Area2D

var timer
var dentro

func _ready():
	get_node("/root/Node2D/Bomba3").body_entered.connect(_on_Area2D_body_enter)
	get_node("/root/Node2D/Bomba3").body_exited.connect(_on_Area2D_body_exit)

func _on_Area2D_body_enter( body ):
	print("Entrou BOMBA 3 ")
	
	dentro = true
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.connect("timeout", _on_Timer_timeout)
	timer.start()
	

func _on_Timer_timeout() -> void:
	var node = get_node("/root/Node2D/Bomba3/Sprite2D")
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

func _on_Timer_timeout2() -> void:
	var node = get_node("/root/Node2D/Bomba3/Sprite2D")
	node.visible = false 


func _on_Area2D_body_exit( body ):
	dentro = false
	print("Saiu BOMBA 3 ")

