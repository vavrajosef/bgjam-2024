extends Path3D

signal path_finished
@export var speed := 10

@onready var follow := %PathFollow3D
var is_on := false

func _process(delta):
	if is_on:
		follow.progress += speed * delta
		if follow.progress_ratio == 1:
			path_finished.emit()
			is_on = false

func set_is_on():
	is_on = true
