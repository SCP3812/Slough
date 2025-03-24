extends RigidBody3D

var speed: float = 5.0
var rotation_speed: float = 2.0

func _process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("forward"):
		direction += transform.basis.z
	elif Input.is_action_pressed("backward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("left"):
		rotate_y(rotation_speed * delta)
	elif Input.is_action_pressed("right"):
		rotate_y(-rotation_speed * delta)
	
	var velocity = direction * speed
	move_and_collide(velocity * delta)
