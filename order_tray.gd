extends Node2D

@export var order_node : Node2D
var items_in_tray = Array()
signal complete_order

func _is_order_complete() -> bool:
	#Simple first check to see if the number of items is the same
	if items_in_tray.size() != order_node.order.size():
		return false
		
	#Check that there are the correct number of anything
	var unchecked_objects = items_in_tray.duplicate()
	for item in order_node.order:
		var object_item : Area2D #Null, otherwise an object in the tray with the name of something on the order
		for object in unchecked_objects:
			if object.name.contains(item):
				object_item = object #This is an object that exists in the tray and that is on the order
		if object_item != null:
			unchecked_objects.erase(object_item)
		else:
			return false #An object is on the tray that is not part of the order
	return true
	
func _try_to_complete_order():
	if _is_order_complete() == true: _complete_order()
	
func _complete_order():
	for item in items_in_tray:
		item.item_ref.garbage = true
	order_node._generate_order() #Remove after adding customers
	emit_signal("complete_order")
		
func _add_item_to_tray(item : Area2D):
	items_in_tray.append(item)
	print_debug(items_in_tray)

func _remove_item_from_tray(item : Area2D):
	items_in_tray.erase(item)
	print_debug(items_in_tray)

func _on_area_2d_area_entered(area: Area2D) -> void:
	_add_item_to_tray(area)
	print_debug("added")

func _on_area_2d_area_exited(area: Area2D) -> void:
	_remove_item_from_tray(area)
	print_debug("removed")


func _on_button_button_up() -> void:
	_try_to_complete_order()
