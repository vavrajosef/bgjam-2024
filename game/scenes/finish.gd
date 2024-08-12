extends Area3D

signal player_entered(player: CharacterBody3D)
@onready var timer := %Timer
var b : CharacterBody3D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
		if body is Player:
			get_tree().get_root().set_disable_input(true)
			body.end_game()
			b = body
			timer.start()
			)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	player_entered.emit(b)
