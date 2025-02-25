extends CanvasLayer

var opacity = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	opacity += delta
	$ColorRect.color = Color(180, 0, 0, opacity)
