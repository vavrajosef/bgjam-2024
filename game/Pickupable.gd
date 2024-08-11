extends StaticBody3D


@export var pickuable : PackedScene = null
@export var xcor := 0.2
@export var ycor := 0.2
@export var zcor := 0.2
@export var shouldRotate := true
@export var pickupableId := 0

@onready var inst : Node3D = null
@onready var col := %CollisionShape3D
# Called when the node enters the scene tree for the first time.
func _ready():
	var box := BoxShape3D.new()
	box.size = Vector3(xcor, ycor, zcor)
	col.shape = box
	inst = pickuable.instantiate()
	inst.position += Vector3(0, 1, 0)
	add_child(inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is Player:
		print("player is here")
		body.add_key(pickupableId)
		queue_free()
