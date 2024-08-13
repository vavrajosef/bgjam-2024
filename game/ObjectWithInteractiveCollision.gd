extends StaticBody3D

@export var model : PackedScene = null
@export var area : Area3D = null
@export var isCollisionOn := true

@onready var collisionShape := %CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if not isCollisionOn:
		collisionShape.disabled = true
	if area != null:
		area.body_entered.connect(area_entered())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func area_entered():
	collisionShape.disabled = true
