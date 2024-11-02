extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Load")
	call_deferred("next_scene")
	pass # Replace with function body.

func next_scene():
	get_tree().change_scene_to_file("res://scenes/start_scene.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
