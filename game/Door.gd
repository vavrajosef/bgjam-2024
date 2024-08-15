extends Node3D

@export var door_model: PackedScene = null
@export var is_key_required := true
@export var key_id := 0
@export var is_open := false
@onready var label := %Label3D
# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "here"
	var door_instance := door_model.instantiate()
	get_parent().add_child(door_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is Player:
		if body.has_key(key_id):
			label.text = "Open"
		else:
			label.text = "You need a key"

func _on_area_3d_body_exited(body):
	label.text = ""
