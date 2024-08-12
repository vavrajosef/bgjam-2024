extends Node3D

signal char_active
signal char_inactive
@onready var cam := %Cam
@onready var char := %"character-male-b2"
var is_char_active := true

# Called when the node enters the scene tree for the first time.
func _ready():
	cam.display_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 5.0)
	switch()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		switch()
	char.set_rotation_angle(cam.get_rotation_camera_angle())

func switch():
	char.set_active(is_char_active)
	is_char_active = not is_char_active
	if is_char_active:
		char_inactive.emit()
	else:
		char_active.emit()

func end_game():
	get_tree().change_scene_to_file("res://scenes/game_finished.tscn")

func _on_finish_player_entered(player):
	end_game()
