extends "item.gd"

@export var cook_time = 0
var cooking = false
var cook_level = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	servable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
		
func _cook():
	cook_level += 1
	if cook_level == cook_time/2:
		$Sprite2D.modulate = "c18e89"
	elif cook_level == cook_time:
		$Sprite2D.modulate = "7f524e"
		servable = true
	elif cook_level > cook_time:
		$Sprite2D.modulate = "2a1004"
		servable = false

func _on_round_timer_round_end() -> void:
	if cooking and not dragging: _cook()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	super._on_area_2d_body_entered(body)
	if body.name.to_lower().contains("cookingstation"):
		cooking = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	super._on_area_2d_body_entered(body)
	if body.name.to_lower().contains("cookingstation"):
		cooking = false
