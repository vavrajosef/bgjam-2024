extends Area3D

signal lever_moved(leverId)
@export var leverId := 0

@onready var leverOff := %Lever_OFF
@onready var leverOn := %Lever_ON

func _on_body_entered(body):
	if body is Player:
		leverOn.visible = true
		leverOff.visible = false
		lever_moved.emit(leverId)


func _on_body_exited(body):
	if body is Player:
		leverOn.visible = false
		leverOff.visible = true
