extends Node
## TO SYNC THE MENU WITH THE MOUSE
var carryingMouth : bool = false;
var currMouth : AnimatedSprite2D
var mouthPlugged : bool = false;

enum INDEX {A,B,C,CH,D,E,F,G,I,J,K,L,M,N,O,P,Q,R,S,SH,T,TH,U,V,W,X,Y,Z}
## When selectedSounds == CORRECT_ANSWERS, the player gets a good ending
const CORRECT_ANSWERS = [
	INDEX.T,
	INDEX.R, 
	INDEX.A,
	INDEX.N,
	INDEX.S,
	INDEX.F,
	INDEX.O,
	INDEX.R,
	INDEX.M,
	INDEX.A,
	INDEX.SH,
	INDEX.U,
	INDEX.N]
## So overlays can match frames
var CHAR_INDEX = ['A','B','C','CH','D','E','F','G','I','J','K','L','M','N','O','P','Q','R','S','SH','T','TH','U','V','W','X','Y','Z']
var soundsSelected : Array[Sound] = []
## The current index in the selections array that the player is selecting. 
var currSound : int = 0;
## Special case for prototype TRANSFORMATION
var totalSounds : int = 12;


func _ready():
	print(INDEX)
	for i in range(0,totalSounds + 1):
		# Fill selections with empty sounds
		soundsSelected.append(Sound.new(true,0))

func printSelections():
	for sound in soundsSelected:
		print("Sound: " + CHAR_INDEX[sound.animFrame] + " Empty? : ", sound.isEmpty, " Index: ", sound.animFrame)
		print(CORRECT_ANSWERS)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
