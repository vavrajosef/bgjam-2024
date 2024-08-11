extends Node3D

@onready var label := %Label3D
@onready var control := %Control
var rotatingLeft := false
var rotatingRight := false
const CAM_SPEED := 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position == null:
		return
	if rotatingLeft:
		rotation += Vector3(0, -CAM_SPEED * delta ,0)
	if rotatingRight:
		rotation += Vector3(0, CAM_SPEED * delta ,0)


func _on_game_char_active():
	var siblings := get_node("/root/Game").get_children()
	var new_parent : Node
	for sibling in siblings:
		if sibling.name == "character-male-b2":
			new_parent = sibling
	get_parent().remove_child(self)
	new_parent.add_child(self)

func _on_game_char_inactive():
	var new_parent := get_parent().get_parent()
	get_parent().remove_child(self)
	new_parent.add_child(self)
	

var mouse_start_pos
var screen_start_position

var dragging = false

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
