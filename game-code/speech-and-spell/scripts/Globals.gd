extends Node
## TO SYNC THE MENU WITH THE MOUSE
var carryingMouth : bool = false;
var currMouth : AnimatedSprite2D
var mouthPlugged : bool = false;
# Called when the node enters the scene tree for the first time.
var selections : Array[int] = []
enum syllables {A_E_I}
func _ready():
	print(syllables.A_E_I)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
