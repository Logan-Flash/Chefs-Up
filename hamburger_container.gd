extends Node2D

var mouse_over: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_over and Input.is_action_pressed("left_click"):
		print("hi")
		$CollisionShape2D.set_deferred("disabled", true)
		

# Don't forget to set to true, maybe use timer
func _on_area_2d_mouse_entered() -> void:
	mouse_over = true


func _on_area_2d_mouse_exited() -> void:
	mouse_over = false
