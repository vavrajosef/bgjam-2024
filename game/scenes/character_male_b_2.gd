class_name Player extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_active := true
var is_dead := false
var is_control_lost := false

var keys := []
@onready var label := %Label
@onready var animation := %AnimationPlayer
@onready var body := %"character-male-b2"
@onready var timer : Timer = %Timer
@onready var walk_sounds := %WalkSounds
var rotationAngle : float = 0

func _ready():
	play_animation("idle", false)

func _physics_process(delta):
	# Add the gravity.
	if is_dead:
		return
	
	if not is_on_floor() and not is_control_lost:
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_active:
		var input_dir = Input.get_vector("a", "d", "w", "s")
		input_dir = input_dir.rotated(rotationAngle)
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if not global_transform.origin.is_equal_approx(global_position - direction) and not is_control_lost:
			body.look_at(global_position - direction, Vector3.UP)
		if direction and not is_control_lost:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			play_animation("walk", false)
			walk_sounds.play_walk()
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			play_animation("idle", false)
		move_and_slide()
	else:
		play_animation("idle", false)
	

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

func set_rotation_angle(_rotationAngle: float):
	rotationAngle = _rotationAngle
	
func end_game():
	is_dead = true
	play_animation("die", false)
	
func play_animation(animation_name: String, force: bool) :
	if force:
		animation.play(animation_name)
		timer.start()
	elif timer.is_stopped() :
		animation.play(animation_name)

func change_footsteps(new_footsteps: int):
	walk_sounds.set_new_terrain(new_footsteps)
	
func lost_control():
	is_control_lost = true

func control_back_on():
	is_control_lost = false
