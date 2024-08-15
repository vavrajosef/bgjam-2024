extends Area3D

@export var is_time_based := false
@export var time := 0.0
@export var should_run_on_its_own := false
@export var pathFollow : Path3D = null
@export var shouldTeleport := false
@export var teleportPoint : Node3D = null
@export var isRepeatable := false
var alreadyVisited := false
var _body : Player = null

@onready var timer := %Timer

func _ready():
	timer.wait_time = time

func _on_body_entered(body):
	if body is Player and not alreadyVisited:
		if not isRepeatable:
			alreadyVisited = true
		_body = body
		body.lost_control()
		if is_time_based:
			timer.start()
		if should_run_on_its_own:
			body.get_parent().remove_child(body)
			pathFollow.add_child_to_follow(body)


func _on_timer_timeout():
	if _body != null:
		_body.control_back_on()
		
func _on_path_finished():
	get_parent().add_child(_body)
	_body.control_back_on()
	if shouldTeleport:
		_body.global_position = teleportPoint.global_position
	else:
		var new_position : Vector3 = pathFollow.remove_child_from_follow(_body)
		_body.global_position = new_position
