extends Node2D

@export var viewportMouth : AnimatedSprite2D
@export var leftMouth : AnimatedSprite2D
@export var rightMouth : AnimatedSprite2D
## Is the mouse cursor in the window?
var insideWindow : bool = false;
## Changes the ?/? syllables when the arrows are pressed or a syllable is confirmed
@export var wordProgressText : RichTextLabel
@export var soundLibrary : Array[AudioStreamMP3] = []
@export var speaker : AudioStreamPlayer2D
func _ready():
	print("Build")
	var format = "[center]%d/%d[/center]"
	wordProgressText.text = format % [Globals.currSound+1,Globals.totalSounds+1]


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
			print(soundLibrary)
			speaker.set_stream(soundLibrary[currFrame])
			speaker.play()


			
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
	if(Globals.soundsSelected[Globals.currSound].isEmpty):
		viewportMouth.animation = "default"
		viewportMouth.frame = 0;
		Globals.mouthPlugged = false;
	else:
		viewportMouth.animation = "syllables"
		viewportMouth.frame = Globals.soundsSelected[Globals.currSound].animFrame;
		

func _on_okay_button_button_up():
	## TODO: Set viewport mouth to empty, advance syllable in word window, on last syllable move on to speech
	if(Globals.mouthPlugged):
		if(Globals.currSound < Globals.totalSounds):
			Globals.soundsSelected[Globals.currSound].isEmpty = false;
			Globals.soundsSelected[Globals.currSound].animFrame = viewportMouth.frame
			Globals.currSound += 1
			resetMouth();
			Globals.printSelections()
			
			var format = "[center]%d/%d[/center]"
			wordProgressText.text = format % [Globals.currSound+1,Globals.totalSounds+1]
		else:
			Globals.soundsSelected[Globals.currSound].isEmpty = false;
			Globals.soundsSelected[Globals.currSound].animFrame = viewportMouth.frame
			print("GAME OVER")
			print(Globals.CORRECT_ANSWERS)
			var intSelections : Array[int]
			for sound in Globals.soundsSelected:
				intSelections.append(sound.animFrame)
			print(intSelections)
			print("GAME WON?: ", Globals.CORRECT_ANSWERS == intSelections )
			if(Globals.CORRECT_ANSWERS == intSelections):
				Globals.gameWon = true
			call_deferred("nextScene")
		print("Okay")
func _on_unplug_button_button_up():
	Globals.soundsSelected[Globals.currSound].isEmpty = true
	Globals.soundsSelected[Globals.currSound].animFrame = 0
	resetMouth();


func _on_left_word_arrow_button_up():
	print("beep")
	if(Globals.currSound > 0):
		Globals.currSound -= 1;
		# Show the previous choice
		var format = "[center]%d/%d[/center]"
		wordProgressText.text = format % [Globals.currSound+1,Globals.totalSounds+1]
		if(Globals.soundsSelected[Globals.currSound].isEmpty == false):
			print("gotttcha")
			viewportMouth.animation = "syllables"
			viewportMouth.frame = Globals.soundsSelected[Globals.currSound].animFrame
			Globals.mouthPlugged = true
			speaker.set_stream(soundLibrary[viewportMouth.frame])
			speaker.play()
	else:
		# TODO: Play error sound
		print("ERROR")

func _on_right_word_arrow_button_up():
	if((Globals.currSound <= Globals.totalSounds) and Globals.mouthPlugged):
		Globals.currSound += 1;
		# Show the next choice
		var format = "[center]%d/%d[/center]"
		wordProgressText.text = format % [Globals.currSound+1,Globals.totalSounds+1]
		if(Globals.soundsSelected[Globals.currSound].isEmpty == false):
			viewportMouth.animation = "syllables"
			viewportMouth.frame = Globals.soundsSelected[Globals.currSound].animFrame
			Globals.mouthPlugged = true
			speaker.set_stream(soundLibrary[viewportMouth.frame])
			speaker.play()
		else:
			viewportMouth.animation = "default"
			Globals.mouthPlugged = false



func _on_left_inventory_arrow_button_up():
	if(rightMouth.frame == 0):
		rightMouth.frame = Globals.INDEX.size() - 1
		leftMouth.frame -= 1
	elif(leftMouth.frame > 0):
		rightMouth.frame -= 1
		leftMouth.frame -= 1
	else:
		leftMouth.frame = Globals.INDEX.size() - 1
		rightMouth.frame -= 1	
	rightMouth.label.text = '[center]' + Globals.CHAR_INDEX[rightMouth.frame] + '[/center]'
	leftMouth.label.text = '[center]' + Globals.CHAR_INDEX[leftMouth.frame] + '[/center]'

func _on_right_inventory_arrow_button_up():
	# Partial wrap around bounds
	if(leftMouth.frame == Globals.INDEX.size() -1):
		leftMouth.frame = 0
		rightMouth.frame += 1
	elif(rightMouth.frame < Globals.INDEX.size() -1):
		leftMouth.frame += 1
		rightMouth.frame += 1
	# Start wrap around bounds
	else:
		rightMouth.frame = 0
		leftMouth.frame += 1
	rightMouth.label.text = '[center]' + Globals.CHAR_INDEX[rightMouth.frame] + '[/center]'
	leftMouth.label.text = '[center]' + Globals.CHAR_INDEX[leftMouth.frame] + '[/center]'

func nextScene():
	get_tree().change_scene_to_file("res://scenes/speech_scene.tscn")
