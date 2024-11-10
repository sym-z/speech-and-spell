extends Node2D

@export var viewportMouth : AnimatedSprite2D
@export var leftMouth : AnimatedSprite2D
@export var rightMouth : AnimatedSprite2D
## Is the mouse cursor in the window?
var insideWindow : bool = false;

func _ready():
	print("Build")

func _process(delta):
	print(insideWindow)
func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_released() and Globals.carryingMouth and !Globals.mouthPlugged:
		print("one")
		Globals.carryingMouth = false;
		if insideWindow:
			print("two")
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
	if(rightMouth.frame == 0):
		rightMouth.frame = Globals.INDEX.size() - 1
		leftMouth.frame -= 1
	elif(leftMouth.frame > 0):
		## TODO CHANGE AUDIO AND OVERLAYS HERE CONDENSE INTO OOP
		rightMouth.frame -= 1
		leftMouth.frame -= 1
	else:
		leftMouth.frame = Globals.INDEX.size() - 1
		rightMouth.frame -= 1

func _on_right_inventory_arrow_button_up():
	# Partial wrap around bounds
	if(leftMouth.frame == Globals.INDEX.size() -1):
		leftMouth.frame = 0
		rightMouth.frame += 1
	elif(rightMouth.frame < Globals.INDEX.size() -1):
		## TODO CHANGE AUDIO AND OVERLAYS HERE CONDENSE INTO OOP
		leftMouth.frame += 1
		rightMouth.frame += 1
	# Start wrap around bounds
	else:
		rightMouth.frame = 0
		leftMouth.frame += 1
	
	pass # Replace with function body.
