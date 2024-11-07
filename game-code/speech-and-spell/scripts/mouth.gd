extends AnimatedSprite2D

@export var homePosition : Marker2D

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
		isHovering = true;
func _on_area_2d_mouse_exited():
	isHovering = false;

signal beingHeld
func _process(delta):
	if isHovering and leftMouseDown and !Globals.mouthPlugged:
		Globals.carryingMouth = true;
		beingHeld.emit($".")
		position = get_viewport().get_mouse_position()
	if Globals.carryingMouth and leftMouseDown and $"." == Globals.currMouth:
		position = get_viewport().get_mouse_position()
		beingHeld.emit($".")
