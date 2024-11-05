extends Node
## TO SYNC THE MENU WITH THE MOUSE
var carryingMouth : bool = false;
var currMouth : AnimatedSprite2D
var mouthPlugged : bool = false;

enum syllableIndex {A_E_I, U, C_D_N_S_T_X_Y_Z, J_SH_CH, G_K, F_V, TH, R, B_M_P, O, L, Q_W}
var selections : Array[int] = []
func _ready():
	print(syllableIndex)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
