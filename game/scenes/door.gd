extends StaticBody3D

@export var is_key_required := true
@export var key_id := 0
@export var is_open := false
@onready var label := %Label3D
@onready var collision := %CollisionShape3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is Player:
		if body.has_key(key_id):
			label.text = "Open"
			collision.call_deferred("set_disabled", true)
		else:
			label.text = "You need a key"

func _on_area_3d_body_exited(body):
	label.text = ""
