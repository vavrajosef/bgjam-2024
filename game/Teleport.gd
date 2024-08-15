class_name Teleport extends Area3D

@export var loc : Node3D = null
@export var onlyOnce := false
@export var is_active := true

var visited := false

func _on_body_entered(body):
	if body is Player and not visited and is_active:
		body.global_position = loc.global_position
		if onlyOnce:
			visited = true

func set_active():
	is_active = true
	
