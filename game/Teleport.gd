extends Area3D

@export var loc : Node3D = null
@export var onlyOnce := false

var visited := false

func _on_body_entered(body):
	if body is Player and not visited:
		body.global_position = loc.global_position
		if onlyOnce:
			visited = true
