extends AnimatedSprite2D


## When player mouses over the mouth
var isHovering : bool = false;
func _on_area_2d_mouse_entered():
	if(!Globals.CARRYING_MOUTH):
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
			Globals.CARRYING_MOUTH = false;

signal beingHeld
func _process(delta):
	if isHovering and leftMouseDown:
		Globals.CARRYING_MOUTH = true;
		beingHeld.emit($".")
		position = get_viewport().get_mouse_position()
	if Globals.CARRYING_MOUTH and leftMouseDown and $"." == Globals.CURR_MOUTH:
		position = get_viewport().get_mouse_position()
		beingHeld.emit($".")

## When the player carries the mouth in and out of the mouth zone. To enlarge the mouth etc.
func switch_animations(anim : String):
	animation = anim
