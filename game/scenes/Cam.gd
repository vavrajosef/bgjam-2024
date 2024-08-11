extends Node3D

@onready var label := %Label3D
@onready var control := %Control
var rotatingLeft := false
var rotatingRight := false
const CAMERA_ROT_SPEED := 1
const CAMERA_MOV_SPEED := 10
var is_active := false
var rotVec := Vector2(1,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position == null:
		return
	if is_active:
		var input_dir = Input.get_vector("a", "d", "w", "s")
		var movement_vector : Vector2 = input_dir * CAMERA_MOV_SPEED * delta
		
		movement_vector = movement_vector.rotated(-rotVec.angle())
		global_position += Vector3(movement_vector.x, 0, movement_vector.y)
	var rotatedBy : float = CAMERA_ROT_SPEED * delta
	if rotatingLeft:
		rotation += Vector3(0, -rotatedBy ,0)
		rotVec = rotVec.rotated(-rotatedBy)
	if rotatingRight:
		rotation += Vector3(0, rotatedBy ,0)
		rotVec = rotVec.rotated(rotatedBy)


func _on_game_char_active():
	is_active = false
	position = Vector3(0,0,0)
	var siblings := get_node("/root/Game").get_children()
	var new_parent : Node
	for sibling in siblings:
		if sibling.name == "character-male-b2":
			new_parent = sibling
	get_parent().remove_child(self)
	new_parent.add_child(self)

func _on_game_char_inactive():
	is_active = true
	position = get_parent().position
	var new_parent := get_parent().get_parent()
	get_parent().remove_child(self)
	new_parent.add_child(self)

func _input(event):
	pass


func get_ui() -> Control:
	return control


func _on_h_box_container_2_mouse_entered():
	rotatingRight = true


func _on_h_box_container_mouse_entered():
	rotatingLeft = true


func _on_h_box_container_mouse_exited():
	rotatingLeft = false


func _on_h_box_container_2_mouse_exited():
	rotatingRight = false

func get_rotation_camera_angle() -> float:
	return -rotVec.angle()
