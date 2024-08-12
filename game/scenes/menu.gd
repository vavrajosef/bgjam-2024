extends Control

@onready var audio := %AudioPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	audio.start_playing()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
