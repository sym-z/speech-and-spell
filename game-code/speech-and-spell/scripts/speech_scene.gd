extends Node2D
@export var mouth : AnimatedSprite2D
@export var backgroundImage : AnimatedSprite2D
func _ready():
	mouth.perform()
func _on_mouth_end_perf():
	mouth.visible = false;
	print("GAME WON: ", Globals.gameWon)
	if(Globals.gameWon):
		backgroundImage.animation = "win"
	else:
		backgroundImage.animation = "loss"
