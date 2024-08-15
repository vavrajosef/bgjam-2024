class_name Teleport extends Area3D

signal end
@export var loc : Node3D = null
@export var onlyOnce := false
@export var is_active := true
@export var has_cooldown := false
@export var emit_end := false

@onready var audio := %AudioStreamPlayer
@onready var timer := %Timer

var body : Player = null

var visited := false

func _on_body_entered(_body):
	if _body is Player and not visited and is_active:
		if has_cooldown:
			timer.start(4)
		else:
			timer.start(0.1)
		body = _body
		if onlyOnce:
			visited = true
		if emit_end:
			end.emit()

func set_active():
	audio.play()
	is_active = true

func _on_timer_timeout():
	body.global_position = loc.global_position
