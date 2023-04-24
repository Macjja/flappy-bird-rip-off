extends CharacterBody2D

const JUMP_VELOCITY = -350.0
var alive = true
var enabled = false
var first_jump = true

signal player_died()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and enabled:
		velocity.y += gravity * delta
	
	if is_on_floor() and not first_jump:
		alive = false
		emit_signal('player_died')

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and alive:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if enabled:
		move_and_slide()
	first_jump = false

func respawn():
	position = Vector2(325, 325)
	alive = true
	enabled = true
	first_jump = true

func _on_hitbox_area_entered(area):
	if area.is_in_group("hurt"):
		alive = false
		print('you lose')
		emit_signal("player_died")
