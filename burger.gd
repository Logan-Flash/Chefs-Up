extends Node2D

var item_name = "Burger"
var in_holder = true
var holder_position = Vector2(56, 275) #Type in script from values of the transform
var dragging = false
var garbage = false
var offset = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging: 
		position = get_global_mouse_position() - offset
	elif garbage:
		queue_free()

func _on_button_button_down() -> void:
	if in_holder:
		var new_item = load("res://burger.tscn").instantiate()
		add_sibling(new_item)
		new_item.position = new_item.holder_position
		in_holder = false
	dragging = true
	offset = get_global_mouse_position() - global_position
	$Sprite2D.z_index = 10 #Bring to front while dragging

func _on_button_button_up() -> void:
	dragging = false
	$Sprite2D.z_index = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Garbage":
		garbage = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Garbage":
		garbage = false
