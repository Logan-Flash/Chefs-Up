extends Node

signal order_completed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Order1.order = ["Burger", "Burger"]
	$Order1._set_label_text()
	$Order2.order = ["Burger", "Burger"]
	$Order2._set_label_text()
	$Order3.order = ["Burger", "Burger"]
	$Order3._set_label_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _order_completed():
	emit_signal("order_completed")
