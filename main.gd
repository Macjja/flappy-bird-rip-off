extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$main_menu/play.connect('pressed', Callable(self, 'set_up_game'))

func set_up_game():
	$main_menu.hide()
	$game.show()
	$game.enable()
