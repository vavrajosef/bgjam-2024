extends Node3D

@onready var label := %Label3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position == null:
		return


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
	if event.is_action("drag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			print(mouse_start_pos)
			print(screen_start_position)
			print("---")
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		print("event")
