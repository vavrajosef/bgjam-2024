class_name Ground extends StaticBody3D

@onready var ground := $Ground
# Called when the node enters the scene tree for the first time.
func _ready():
	ground.create_convex_collision()

func disable_collision():
	var statics := ground.get_children()
	for s in statics:
		if s is StaticBody3D:
			var collisions := s.get_children()
			for col in collisions:
				if col is CollisionShape3D:
					col.call_deferred("set_disabled", true)
	
func enable_collision():
	var statics := ground.get_children()
	for s in statics:
		if s is StaticBody3D:
			var collisions := s.get_children()
			for col in collisions:
				if col is CollisionShape3D:
					col.call_deferred("set_disabled", false)
