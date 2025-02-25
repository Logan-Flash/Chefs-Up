extends Node2D

@export var item_name = ""
@export var cookable = false
var servable = true
var in_holder = true
@export var holder_position : Vector2 #Type in script from values of the transform in the game_scene
var dragging = false
var garbage = false
var offset = Vector2(0,0)

func _process(delta: float) -> void:
	if dragging: 
		position = get_global_mouse_position() - offset
	elif garbage:
		queue_free()

func _on_button_button_down() -> void:
	if in_holder: #Spawn next item
		var new_item = load("res://" + item_name.to_lower() + ".tscn").instantiate()
		add_sibling(new_item)
		new_item.position = new_item.holder_position
		#If the item is cookable, it will need to listen for round ends
		if new_item.cookable == true: 
			$"../RoundTimer".round_end.connect(new_item._on_round_timer_round_end)
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
