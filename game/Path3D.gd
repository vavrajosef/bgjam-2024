extends Path3D

var is_active = false

@onready var follow := $PathFollow3D
var currentAddition := 0.2

func _process(delta):
	if is_active:
		var nextProgress : float = follow.progress_ratio + (currentAddition * delta)
		if currentAddition > 0 and nextProgress >= 1.0:
			currentAddition = -currentAddition
			follow.progress_ratio = 1.0
		elif currentAddition < 0 and nextProgress <= 0.0:
			currentAddition = -currentAddition
			follow.progress_ratio = 0.0
		else:
			follow.progress_ratio = nextProgress
		

func set_active():
	is_active = true
