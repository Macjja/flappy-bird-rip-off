extends Node2D

const SPEED = 400.0
@export var enabled : bool = false
var start_pos = Vector2(-10, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position = start_pos
	if enabled:
		respawn()
		
func respawn():
	position = start_pos
	position.y = randf_range(-300, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enabled:
		position.x -= SPEED * delta


func _on_respawn_area_entered(area):
	respawn()
	enabled = not enabled
