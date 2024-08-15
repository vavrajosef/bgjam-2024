extends Node3D


@onready var mystic_music := %mystic_music
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_playing():
	mystic_music.play()
