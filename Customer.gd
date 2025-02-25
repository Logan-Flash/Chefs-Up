extends Node2D

@onready var pathFollow = $Path/PathFollow
var speed = 1
var leaving = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if pathFollow.progress != 256 or leaving:
		$Path/PathFollow/AnimatedSprite2D.play()
		$Path/PathFollow/AnimatedSprite2D.animation = "Walk"
		
		pathFollow.progress += speed 
	
	if pathFollow.progress == 256:
		$Path/PathFollow/AnimatedSprite2D.animation = "Idle"
		
	if pathFollow.progress_ratio == 1:
		
		leaving = false
		pathFollow.progress_ratio = 0


func _on_order_tray_1_complete_order() -> void:
	leaving = true # Replace with function body.


func _on_order_tray_2_complete_order() -> void:
	leaving = true # Replace with function body.


func _on_order_tray_3_complete_order() -> void:
	leaving = true # Replace with function body.
