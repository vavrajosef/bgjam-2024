extends CollisionShape3D


# Called when the node enters the scene tree for the first time.
signal player_entered(player: CharacterBody3D)

@onready var GroundCol := %SurfaceGroundCollision
# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
		if body is Player:
			GroundCol.disable_mode = true
			
			)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
