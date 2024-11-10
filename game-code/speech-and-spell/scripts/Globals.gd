extends Node
## TO SYNC THE MENU WITH THE MOUSE
var carryingMouth : bool = false;
var currMouth : AnimatedSprite2D
var mouthPlugged : bool = false;

enum INDEX {A,B,C,CH,D,E,F,G,I,J,K,L,M,N,O,P,Q,R,S,SH,T,TH,U,V,W,X,Y,Z}
## So overlays can match frames
var CHAR_INDEX = ['A','B','C','CH','D','E','F','G','I','J','K','L','M','N','O','P','Q','R','S','SH','T','TH','U','V','W','X','Y','Z']
var selections : Array[int] = []



func _ready():
	print(INDEX)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
