extends Node2D

var currMouth : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Build")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_mouse_entered():
	if(Globals.CARRYING_MOUTH):
		currMouth.animation = "large"
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	if(Globals.CARRYING_MOUTH):
		currMouth.animation = "default"
	pass # Replace with function body.


func _on_mouth_being_held(mouth):
	currMouth = mouth;
	pass # Replace with function body.
