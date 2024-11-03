extends AnimatedSprite2D

## The image this icon is referencing
@export var frameIndex : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	frame = frameIndex
	pass # Replace with function body.

## Changes frame to new index
func refresh(newFrame : int):
	frame = newFrame
