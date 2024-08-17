extends Area3D

@export var soundId := 0
@export var isTurnOn := true
@export var forceOnly := false


func _on_body_entered(body):
	if body is Player:
		if isTurnOn:
			SoundPlayer.stop_playing_amibence()
			SoundPlayer.start_playing(soundId, forceOnly)
		else:
			SoundPlayer.stop_playing(soundId)
