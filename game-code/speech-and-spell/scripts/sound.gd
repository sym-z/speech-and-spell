class_name Sound extends Node
## Selection array is an array of Sounds
var isEmpty : bool
var animFrame : int
#var soundEffect : AudioStreamMP3

func _init(_isEmpty : bool, _animFrame : int,):
	isEmpty = _isEmpty
	animFrame = _animFrame
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
