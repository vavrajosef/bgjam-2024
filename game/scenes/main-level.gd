extends Node3D

signal char_active
signal char_inactive
@onready var cam := %Cam
@onready var char := %"character-male-b2"
var is_char_active := true

@onready var stone_portal : Teleport = %"Teleport --> Cave"
@onready var wood_portal : Teleport = %"Teleport --> Sky"
@onready var teleport_end : Teleport = %TeleportEnd

@onready var cloudPath := %CloudPath
@onready var turnoffcol := %TurnOffCollisionForGround

var placed_gems := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundPlayer.start_playing(SoundPlayer.OUTSIDE, true)
	switch()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("e"):
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


func _on_gem_tower_gem_placed():
	placed_gems += 1
	if placed_gems == 3:
		cam.get_ui().append_display_text_btn("This could get the wooden portal working", "Let's try it!")
		wood_portal.set_active()
	if placed_gems >= 4:
		start_moving_cloud()

func get_ui() -> Control :
	return cam.get_ui()

func start_moving_cloud():
	turnoffcol.set_active()
	cloudPath.set_active()

func stone_portal_activate():
	stone_portal.set_active()
	cam.get_ui().append_display_text_btn("Is the stone portal working now?", "Maybe it is")
	
func on_path_finished():
	teleport_end.set_active()
	cam.get_ui().append_display_text_btn("Yes! Now I know how to glitch. Once I get into the cave you will no longer reign over my body.", "What?")
