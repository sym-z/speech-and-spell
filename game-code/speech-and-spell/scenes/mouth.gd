extends AnimatedSprite2D

@export var homePosition : Marker2D

## When player mouses over the mouth
var isHovering : bool = false;
func _on_area_2d_mouse_entered():
	if(!Globals.carryingMouth):
		isHovering = true;
func _on_area_2d_mouse_exited():
	isHovering = false;

## When the player is intending to carry the mouth
var leftMouseDown : bool = false;
func _input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed():
			leftMouseDown = true;
		else:
			leftMouseDown = false;
			

signal beingHeld
func _process(delta):
	if isHovering and leftMouseDown and !Globals.mouthPlugged:
		Globals.carryingMouth = true;
		beingHeld.emit($".")
		position = get_viewport().get_mouse_position()
	if Globals.carryingMouth and leftMouseDown and $"." == Globals.currMouth:
		position = get_viewport().get_mouse_position()
		beingHeld.emit($".")
