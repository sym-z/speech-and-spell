extends Node2D

func _ready():
	print("Start")
	call_deferred("next_scene")

func next_scene():
	get_tree().change_scene_to_file("res://scenes/build_scene.tscn")
