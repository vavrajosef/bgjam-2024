class_name InteractiveObject extends StaticBody3D

@export var is_visible := true
@export var has_collision := true
@export var turnOffVisibilityArea : Area3D = null
@export var turnOffCollisionArea : Area3D = null
@export var turnOnVisibilityArea : Area3D = null
@export var turnOnCollisionArea : Area3D = null

@onready var collision := %CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if not is_visible:
		visible = false
	if not has_collision:
		collision.disabled = true
	if turnOffCollisionArea != null:
		turnOffCollisionArea.body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
			if body is Player:
				collision.call_deferred("set_disabled", true)
			)
	if turnOnCollisionArea != null:
		turnOnCollisionArea.body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
			if body is Player:
				collision.call_deferred("set_disabled", false)
			)
	if turnOffVisibilityArea != null:
		turnOffVisibilityArea.body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
			if body is Player:
				call_deferred("set_visible", false)
			)
	if turnOnVisibilityArea != null:
		turnOnVisibilityArea.body_entered.connect(func _on_area_entered(body: CharacterBody3D) -> void :
			if body is Player:
				call_deferred("set_visible", true)
			)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
