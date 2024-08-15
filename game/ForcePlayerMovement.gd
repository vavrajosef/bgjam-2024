extends Path3D

signal path_finished
@export var speed := 0.2

@onready var follow :PathFollow3D = $PathFollow3D

var _player : Player = null
var is_on := false

func _process(delta):
	if is_on:
		var new_progress : float = follow.progress_ratio + (speed * delta)
		if new_progress >= 1.0:
			_player.play_animation("idle", true)
			path_finished.emit()
			is_on = false
		else:
			_player.play_animation("walk", true)
			follow.progress_ratio += speed * delta

func set_is_on():
	is_on = true

func add_child_to_follow(player : Player):
	follow.add_child(player)
	_player = player
	_player.position = Vector3(0,0,0)
	set_is_on()

func remove_child_from_follow(player: Player) -> Vector3:
	_player = null
	follow.remove_child(player)
	follow.progress_ratio = 1
	return follow.global_position
