class_name CanBePickedUp extends StaticBody3D

@export var pickupableId := 0
@export var canBePickedUpYet := true

@onready var collision := $CollisionShape3D

func _ready():
	setCanBePickedUpYet(canBePickedUpYet)

func _on_area_3d_body_entered(body):
	if body is Player and canBePickedUpYet:
		body.add_key(pickupableId)
		queue_free()

func setCanBePickedUpYet(new_val : bool):
	canBePickedUpYet = new_val
	collision.disabled = not canBePickedUpYet
