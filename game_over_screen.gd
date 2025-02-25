extends CanvasLayer

var opacity = 0
var been_fired = false
signal fired
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _ready():
	#fired.connect($"../Sound Manager"._on_fired)

func _process(delta: float) -> void:
	opacity += delta
	$ColorRect.color = Color(180, 0, 0, opacity)
	if (opacity > 0.5 and not been_fired):
		print_debug("Made it")
		emit_signal("fired")
		been_fired = true
