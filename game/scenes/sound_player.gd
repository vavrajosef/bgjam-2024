extends Node3D

const MUSIC = 0
const OUTSIDE = 1
const CAVE = 2
const DEEPCAVE = 3

@onready var music := $music
@onready var outside := $outside
@onready var deepcave := $deepcave
@onready var cave := $cave

@onready var soundArray := [music, outside, deepcave, cave]

func start_playing(id: int, only: bool):
	if only:
		for soundId in range(soundArray.size()):
			var currentSound : AudioStreamPlayer = soundArray[soundId]
			if soundId != id:
				currentSound.stop()
	var currentSound : AudioStreamPlayer = soundArray[id]
	if not currentSound.playing:
		currentSound.play()
	
func stop_playing_amibence():
	stop_playing(1)
	stop_playing(2)
	stop_playing(3)
	
func stop_playing(id: int):
	var idSound : AudioStreamPlayer = soundArray[id]
	if idSound.playing:
		idSound.stop()
		
func volume_down():
	music.volume_db -= 10
	
func volume_up():
	music.volume_db += 10
