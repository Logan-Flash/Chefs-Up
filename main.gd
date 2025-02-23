extends Node
@export var hamburger_scene: PackedScene
@export var bun_scene: PackedScene
@export var lettuce_scene: PackedScene
@export var cheese_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_hamburger_container_hamburger_clicked() -> void:
	var hamburger = hamburger_scene.instantiate()
	add_child(hamburger)


func _on_bun_container_bun_clicked() -> void:
	var bun = bun_scene.instantiate()
	add_child(bun)
	


func _on_lettuce_container_lettuce_clicked() -> void:
	var lettuce = lettuce_scene.instantiate()
	add_child(lettuce)
	


func _on_cheese_container_cheese_clicked() -> void:
	var cheese = cheese_scene.instantiate()
	add_child(cheese)
