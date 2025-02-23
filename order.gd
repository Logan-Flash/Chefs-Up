extends Node

var orders = [["Bun", "Burger", "Bun"],["Bun", "Lettuce", "Burger", "Bun"], ["Bun", "Cheese", "Burger", "Cheese", "Burger", "Bun"]]
var order : Array
@export var order_label : Label
	
func _generate_order():
	var num = randi_range(0,order.size()-1)
	order = orders[num]
	_set_label_text()
	
func _set_label_text():
	var order_string = ""
	for item in order:
		order_string += item + "\n"
	order_label.text = order_string
	
func _clear_label():
	order_label.text = ""
	
#On customer leaves, clear the label

#On new customer enters, generate new order
	
