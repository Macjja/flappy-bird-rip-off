extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.connect("player_died", Callable($HurtPipes, '_on_player_death'))
	$Player.connect("player_died", Callable($gui, 'game_over'))
	$HurtPipes.connect("add_point", Callable($gui, 'add_points'))

func enable():
	$Player.respawn()
	$HurtPipes.enable()


func _on_respawn_pressed():
	enable()
