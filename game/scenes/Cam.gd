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
