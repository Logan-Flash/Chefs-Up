extends Node2D

var mouseOver : bool
var mousePos : Vector2 = Vector2.ZERO
var diff : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	diff = mousePos - get_global_mouse_position()
	
	if Input.is_action_pressed("left_click") and mouseOver and diff != Vector2.ZERO:
		global_position -= diff

	mousePos = get_global_mouse_position()
func _on_area_2d_mouse_entered() -> void:
	mouseOver = true


func _on_area_2d_mouse_exited() -> void:
	mouseOver = false
