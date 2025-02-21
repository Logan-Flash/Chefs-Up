extends Node
@export var hamburger_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hamburger_container_spawn_thing() -> void:
	var hamburger = hamburger_scene.instantiate()
	add_child(hamburger)
