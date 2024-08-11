class_name Player extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_active := true

var keys := []
@onready var label := %Label
@onready var animation := %AnimationPlayer
@onready var body := %"character-male-b"

func _ready():
	animation.play("idle")

func _physics_process(delta):
	# Add the gravity.
	
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_active:
		var input_dir = Input.get_vector("a", "d", "w", "s")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if not global_transform.origin.is_equal_approx(global_position - direction):
			body.look_at(global_position - direction, Vector3.UP)
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			animation.play("walk")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			animation.play("idle")
		move_and_slide()
	else:
		animation.play("idle")
	

func set_active(new_active):
	is_active = new_active


func show_message():
	label.visible = true
	label.global_position = global_position
	var pos : Vector3 = label.get_global_position()
	pos.y += 0.85
	label.set_global_position(pos)


func has_key(keyId) -> bool : 
	return keys.has(keyId)

func add_key(keyId):
	keys.append(keyId)
