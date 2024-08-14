extends Area3D

@export var terrain_id := 0

func _on_body_entered(body):
	if body is Player:
		body.change_footsteps(terrain_id)
