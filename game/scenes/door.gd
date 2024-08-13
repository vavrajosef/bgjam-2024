extends StaticBody3D

@export var is_key_required := true
@export var key_id := 0
@export var is_open := false
@onready var label := %Label3D
@onready var collision := %CollisionShape3D
@onready var door_open_sound := %door_open
@onready var door_unlock_sound := %door_unlock
@onready var door_close_sound := %door_close


# Called when the node enters the scene tree for the first time.
func _ready():
	if not is_key_required:
		is_open = true
		collision.call_deferred("set_disabled", true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is Player:
		if body.has_key(key_id) and not is_open:
			door_unlock_sound.play()
			is_open = true
		if body.has_key(key_id) or is_open:
			if not door_unlock_sound.is_playing():
				door_open_sound.play()
			collision.call_deferred("set_disabled", true)
		else:
			label.text = "You need a key"

func _on_area_3d_body_exited(body):
	label.text = ""
	if is_open:
		door_close_sound.play()
