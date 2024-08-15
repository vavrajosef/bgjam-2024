class_name InvisbleCanBePickedUp extends CanBePickedUp

@export var is_visible := true

@export var turnOffVisibilityArea : Area3D = null
@export var turnOnVisibilityArea : Area3D = null

func _ready():
	if not is_visible:
		visible = false
	if turnOffVisibilityArea != null:
		turnOffVisibilityArea.body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
			if body is Player:
				call_deferred("set_visible", false)
				setCanBePickedUpYet(false)
			)
	if turnOnVisibilityArea != null:
		turnOnVisibilityArea.body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
			if body is Player:
				call_deferred("set_visible", true)
				setCanBePickedUpYet(true)
			)
