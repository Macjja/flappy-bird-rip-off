extends Node2D

signal add_point

func enable():
	$pipe.enabled = false
	$pipe2.enabled = false
	$pipe.respawn()
	$pipe2.respawn()
	$pipe.enabled = true

func disable():
	$pipe.enabled = false
	$pipe2.enabled = false
	$pipe.repawn()
	$pipe2.repawn()

# Called when the node enters the scene tree for the first time.
func _on_player_death():
	$pipe.enabled = false
	$pipe2.enabled = false


func _on_point_awarder_area_entered(area):
	if area.is_in_group('player'):
		emit_signal('add_point')
