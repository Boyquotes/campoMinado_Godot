extends CharacterBody2D
const speed = 100


func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var direction = Vector2(0,0)
	if (Input.is_key_pressed(KEY_UP)):
		direction += Vector2(0,-1)
	if (Input.is_key_pressed(KEY_DOWN)):
		direction += Vector2(0,1)
	if (Input.is_key_pressed(KEY_LEFT)):
		direction += Vector2(-1,0)
	if (Input.is_key_pressed(KEY_RIGHT)):
		direction += Vector2(1,0)
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		print ("Collision with ", collision.get_collider().get_name())

