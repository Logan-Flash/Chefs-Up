extends Node2D

var in_holder = true
var holder_position = Vector2(92, 267) #Type in script from values of the transform
var dragging = false
var offset = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging: 
		position = get_global_mouse_position() - offset


func _on_button_button_down() -> void:
	if in_holder:
		var new_item = load("res://item.tscn").instantiate()
		add_sibling(new_item)
		new_item.position = new_item.holder_position
		in_holder = false
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
