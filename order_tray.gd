extends Node2D

@export var order_node : Node2D
var items_in_tray = Array()
	
func _is_order_complete() -> bool:
	#Simple first check to see if the number of items is the same
	if items_in_tray.size() != order_node.order.size():
		return false
		
	#Check that there are the correct number of anything
	var unchecked_objects = items_in_tray
	for item in order_node.order:
		var object_item : Node2D #Null, otherwise an object in the tray with the name of something on the order
		for object in unchecked_objects:
			if object.name.contains(item):
				object_item = object #This is an object that exists in the tray and that is on the order
		if object_item != null:
			unchecked_objects.erase(object_item)
		else:
			return false #An object is on the tray that is not part of the order
	return true
	
func _complete_order():
	for item in items_in_tray:
		item.free()
		
func _add_item_to_tray(item : Node2D):
	items_in_tray.append(item)
