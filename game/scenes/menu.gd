extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print(SoundPlayer.MUSIC)
	SoundPlayer.start_playing(SoundPlayer.MUSIC, false)


func _on_exit_pressed():
	get_tree().quit()


func _on_start_pressed():
	SoundPlayer.stop_playing(SoundPlayer.MUSIC)
	get_tree().change_scene_to_file("res://scenes/main-level.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
