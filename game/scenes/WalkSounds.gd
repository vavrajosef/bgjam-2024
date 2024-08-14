extends Node3D


@onready var stone_sounds := [$walk_stone_1, $walk_stone_2, $walk_stone_3, $walk_stone_4, $walk_stone_5, $walk_stone_6]
@onready var grass_sounds := [$walk_grass_1, $walk_grass_2, $walk_grass_3, $walk_grass_4, $walk_grass_5, $walk_grass_6, $walk_grass_7, $walk_grass_8, $walk_grass_9, $walk_grass_10]
@onready var sounds := [stone_sounds, grass_sounds]

const STONE = 0
const GRASS = 1
var current_terrain := GRASS

@onready var timer := %TimerWalk

func play_walk():
	if timer.is_stopped():
		timer.start()
		var sound : AudioStreamPlayer = sounds[current_terrain].pick_random()
		sound.play()
		

func set_new_terrain(new_terrain: int):
	current_terrain = new_terrain
