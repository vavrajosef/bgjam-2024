extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_active := true

@onready var label := %Label

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
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			%AnimationPlayer.play("walk")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	else:
		%AnimationPlayer.play("idle")
		
	label.text = str(global_position)
	move_and_slide()

func set_active(new_active):
	is_active = new_active


func show_message():
	label.visible = true
	label.global_position = global_position
	var pos : Vector3 = label.get_global_position()
	pos.y += 0.85
	label.set_global_position(pos)
