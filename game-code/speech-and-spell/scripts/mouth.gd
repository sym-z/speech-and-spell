extends AnimatedSprite2D

@export var homePosition : Marker2D
## The starting frame of the mouth 
@export var startingFrame : int = 0
## Handles switching between mouth shapes
## The overlay node that gets changed depending on the mouth's frame
@export var overlay : AnimatedSprite2D

@export var label : RichTextLabel
@export var usingLabel : bool = true

func _ready():
	frame = startingFrame
	label.text = '[center]' + Globals.CHAR_INDEX[frame] + '[/center]'
	if !usingLabel:
		label.visible = false
	
## When the player is intending to carry the mouth
var leftMouseDown : bool = false;
func _input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed():
			leftMouseDown = true;
		else:
			leftMouseDown = false;

## When player mouses over the mouth
var isHovering : bool = false;
func _on_area_2d_mouse_entered():
	if(!Globals.carryingMouth or !leftMouseDown):
		print("Hovering")
		label.text = '[center]' + Globals.CHAR_INDEX[frame] + '[/center]'
		if usingLabel:
			label.visible = false 
		isHovering = true;
func _on_area_2d_mouse_exited():
	if usingLabel:
		label.visible = true
	isHovering = false;

signal beingHeld
func _process(delta):

	if isHovering and leftMouseDown and !Globals.mouthPlugged:
		Globals.carryingMouth = true;
		if usingLabel:
			label.visible = false;
		beingHeld.emit($".")
		position = get_viewport().get_mouse_position()
	## Prevents fast mouse movement messing up the mouth's tracking
	if Globals.carryingMouth and leftMouseDown and $"." == Globals.currMouth:
		position = get_viewport().get_mouse_position()
		beingHeld.emit($".")
