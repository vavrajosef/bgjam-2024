extends Area3D

signal player_entered(player: CharacterBody3D)

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
		if body is Player:
			player_entered.emit(body)
			)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
