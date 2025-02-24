extends Node2D

@onready var pathFollow = $Path/PathFollow
var speed = 1
var leaving = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if pathFollow.progress != 256 or leaving:
		pathFollow.progress += speed 
	
	if pathFollow.progress_ratio == 1:
		leaving = false
		pathFollow.progress_ratio = 0
