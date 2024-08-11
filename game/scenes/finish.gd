extends Area3D

signal player_entered(player: CharacterBody3D)

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
		print("something")
		if body is Player:
			player_entered.emit()
			)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
