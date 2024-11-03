extends AnimatedSprite2D


## When player mouses over the mouth
var isHovering : bool = false;
func _on_area_2d_mouse_entered():
	isHovering = true;
func _on_area_2d_mouse_exited():
	isHovering = false;

signal beingHeld
## When the player is intending to carry the mouth
var leftMouseDown : bool = false;
func _input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed():
			leftMouseDown = true;
		else:
			leftMouseDown = false;
			Globals.CARRYING_MOUTH = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var speed = 1000;
func _process(delta):
	#print("leftMouseDown: ", leftMouseDown, " isHovering: ", isHovering, " carryingMouth: ", Globals.CARRYING_MOUTH)
	if isHovering and leftMouseDown:
		Globals.CARRYING_MOUTH = true;
		beingHeld.emit($".")
		position = get_viewport().get_mouse_position()
	if Globals.CARRYING_MOUTH and leftMouseDown:
		position = get_viewport().get_mouse_position()
		Globals.CURRENT_MOUTH = get_tree().current_scene as AnimatedSprite2D
	pass

## When the player carries the mouth in and out of the mouth zone. To enlarge the mouth etc.
func switch_animations(anim : String):
	animation = anim
