extends Control

var score = 0

func add_points():
	score += 1
	$score.text = str(score)

func game_over():
	$score.hide()
	$game_over.show()
	$game_over/score.text = 'Your score: ' + str(score)


func _on_respawn_pressed():
	score = 0
	$score.text = str(score)
	$score.show()
	$game_over.hide()
	
