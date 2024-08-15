extends StaticBody3D

@export var gem_id := 0
@export var line_array : Array[Node3D] = []

@onready var sounds := [$gem_placed_sound_1, $gem_placed_sound_2, $gem_placed_sound_3]
@onready var gem := %Gem_032

var gem_is_placed := false

func _ready():
	gem.visible = false

signal gem_placed

func _on_area_3d_body_entered(body):
	if body is Player:
		if body.has_key(gem_id) and not gem_is_placed:
			gem_is_placed = true
			gem_placed.emit()
			gem.visible = true
			var sound :AudioStreamPlayer = sounds.pick_random()
			sound.play()
			for line in line_array:
				line.visible = true
