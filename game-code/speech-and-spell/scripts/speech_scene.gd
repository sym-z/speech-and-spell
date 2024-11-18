extends Node2D
@export var mouth : AnimatedSprite2D
@export var backgroundImage : AnimatedSprite2D
@export var goodSound : AudioStreamMP3
@export var badSound : AudioStreamMP3
@export var speaker : AudioStreamPlayer2D

func _ready():
	mouth.perform()
func _on_mouth_end_perf():
	mouth.visible = false;
	print("GAME WON: ", Globals.gameWon)
	if(Globals.gameWon):
		goodEnd()
	else:
		badEnd()
func badEnd():
	backgroundImage.animation = "loss"
	speaker.stream = badSound
	speaker.play()
func goodEnd():
	backgroundImage.animation = "win"
	speaker.stream = goodSound
	speaker.play()
