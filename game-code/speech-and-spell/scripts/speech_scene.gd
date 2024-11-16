extends Node2D
@export var mouth : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	mouth.perform()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouth_end_perf():
	print("SHOW CORRECT IMAGE")
	pass # Replace with function body.
