class_name CollisionObj extends StaticBody3D

@onready var col := %CollisionShape3D

@export var is_collision_on := true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_collision_on:
		col.disabled = false
	else:
		col.disabled = true
