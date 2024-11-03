extends Node2D

@export var viewportMouth : AnimatedSprite2D
## Is the mouse cursor in the window?
var insideWindow : bool = false;

func _ready():
	print("Build")


func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_released() and Globals.carryingMouth and !Globals.mouthPlugged:
		Globals.carryingMouth = false;
		if insideWindow:
			Globals.mouthPlugged = true;
			
			Globals.currMouth.position = Globals.currMouth.homePosition.position
			Globals.currMouth.animation = "default"
			
			viewportMouth.animation = "syllables"
			viewportMouth.frame = Globals.currMouth.frame
			print("PLOP!")

			
func _on_area_2d_mouse_entered():
	insideWindow = true;
	if(Globals.carryingMouth):
		Globals.currMouth.animation = "large"

func _on_area_2d_mouse_exited():
	insideWindow = false;
	if(Globals.carryingMouth):
		Globals.currMouth.animation = "default"

func _on_mouth_being_held(mouth):
	Globals.currMouth = mouth;


func _on_okay_button_button_up():
	## TODO: Set viewport mouth to empty, advance syllable in word window
	viewportMouth.animation = "default"
	viewportMouth.frame = 0;
	
	Globals.mouthPlugged = false;
	print("Okay")


func _on_left_word_arrow_button_up():
	pass # Replace with function body.

func _on_right_word_arrow_button_up():
	pass # Replace with function body.
