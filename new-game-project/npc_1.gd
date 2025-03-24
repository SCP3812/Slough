extends MeshInstance3D

@onready var player = get_node("../Player")
var rotation_speed: float = 5.0
func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		var target_rotation = atan2(direction.x, direction.z)  # Get Y-axis angle
		rotation.y = lerp_angle(rotation.y, target_rotation-90, rotation_speed * delta)
