class_name Pickupable extends StaticBody3D


@export var pickuable : PackedScene = null
@export var xcor := 0.2
@export var ycor := 0.2
@export var zcor := 0.2
@export var shouldRotate := true
@export var pickupableId := 0

@onready var inst : Node3D = null
@onready var col := %CollisionShape3D
var vects := [Vector3(0,0,1), Vector3(1,0,0), Vector3(0,0,-1), Vector3(-1,0,0)]
var currentIndex := 0
var vecFrom := Vector3(0,0,0)
var vecTo := Vector3(0,0,0)
var t := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	var box := BoxShape3D.new()
	box.size = Vector3(xcor, ycor, zcor)
	col.shape = box
	inst = pickuable.instantiate()
	inst.position += Vector3(0, 1, 0)
	add_child(inst)
	vecFrom = vects[currentIndex]
	update_index()
	vecTo = vects[currentIndex]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shouldRotate:
		t += delta * 0.4
		if inst.rotation == vecTo:
			vecFrom = vects[currentIndex]
			update_index()
			vecTo = vects[currentIndex]
		inst.rotation = vecFrom.lerp(vecTo, t)


func _on_area_3d_body_entered(body):
	if body is Player:
		body.add_key(pickupableId)
		queue_free()

func update_index():
	currentIndex += 1
	if currentIndex > 3:
		currentIndex = 0
