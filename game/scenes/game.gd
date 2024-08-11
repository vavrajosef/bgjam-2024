extends Node3D

signal char_active
signal char_inactive
@onready var cam := %Cam
@onready var char := %"character-male-b2"
@onready var ui := %Control

const CAMERA_SPEED := 10
var is_active := false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	ui.button_pressed.connect(func abc() -> void: 
		show_message()
		)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		switch()
		
	if is_active:
		var input_dir = Input.get_vector("a", "d", "w", "s")
		var movement_vector : Vector2 = input_dir * CAMERA_SPEED * delta
		cam.global_position += Vector3(movement_vector.x, 0, movement_vector.y)

func switch():
	char.set_active(is_active)
	is_active = not is_active
	cam.position = Vector3(0,0,0)
	cam.global_position = Vector3(0,0,0)
	cam.transform = char.transform
	if is_active:
		char_inactive.emit()
	else:
		char_active.emit()
		cam.position = Vector3(0,0,0)

func show_message():
	char.show_message()


func end_game():
	get_tree().quit()
	


func _on_finish_player_entered(player):
	end_game()
