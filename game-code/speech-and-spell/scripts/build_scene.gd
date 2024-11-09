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
			var currFrame = Globals.currMouth.frame
			Globals.currMouth.animation = "default"
			Globals.currMouth.frame = currFrame
			
			viewportMouth.animation = "syllables"
			viewportMouth.frame = currFrame
			print("PLOP!")

			
func _on_area_2d_mouse_entered():
	insideWindow = true;
	if(Globals.carryingMouth):
		var currFrame = Globals.currMouth.frame
		Globals.currMouth.animation = "large"
		Globals.currMouth.frame = currFrame

func _on_area_2d_mouse_exited():
	insideWindow = false;
	if(Globals.carryingMouth):
		var currFrame = Globals.currMouth.frame
		Globals.currMouth.animation = "default"
		Globals.currMouth.frame = currFrame
		
## Signal from mouth instance being caught
func _on_mouth_being_held(mouth):
	Globals.currMouth = mouth;

func resetMouth():
	viewportMouth.animation = "default"
	viewportMouth.frame = 0;
	Globals.mouthPlugged = false;
func _on_okay_button_button_up():
	## TODO: Set viewport mouth to empty, advance syllable in word window, on last syllable move on to speech
	resetMouth();
	print("Okay")
func _on_unplug_button_button_up():
	resetMouth();


func _on_left_word_arrow_button_up():
	pass # Replace with function body.

func _on_right_word_arrow_button_up():
	pass # Replace with function body.


func _on_left_inventory_arrow_button_up():
	pass # Replace with function body.

func _on_right_inventory_arrow_button_up():
	pass # Replace with function body.
