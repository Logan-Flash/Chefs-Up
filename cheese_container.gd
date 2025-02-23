extends Node2D
signal cheeseClicked
var mouse_over: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_over and Input.is_action_pressed("left_click"):
		cheeseClicked.emit()
		make_unclickable()
		

# Don't forget to set to true, maybe use timer
func _on_area_2d_mouse_entered() -> void:
	mouse_over = true

func make_unclickable():
	$ClickTimeout.start()
	$Area2D/CollisionShape2D.disabled = true
	
func _on_area_2d_mouse_exited() -> void:
	mouse_over = false


func _on_click_timeout_timeout() -> void:
	$Area2D/CollisionShape2D.disabled = false
