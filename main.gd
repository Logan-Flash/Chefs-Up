extends Node
@export var hamburger_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(15):
		var hamburger = hamburger_scene.instantiate()
		hamburger.position = Vector2(50, 250)
		add_child(hamburger)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
