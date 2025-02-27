extends Node

var orders = [["Bun", "Burger", "Bun"],
["Bun", "Lettuce", "Burger", "Bun"], 
["Bun", "Cheese", "Burger", "Cheese", "Burger", "Bun"],
["Bun", "Cheese", "Lettuce", "Burger", "Bun"],
["Bun", "Lettuce", "Lettuce", "Lettuce", "Bun"],
["Bun", "Cheese", "Burger", "Bun"],
["Bun", "Cheese", "Cheese", "Burger", "Bun"],
["Cheese", "Burger"],
["Burger"],
["Bun", "Lettuce", "Cheese", "Burger", "Burger", "Bun"]]
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
	
func _clear_order():
	order = []
	_set_label_text()
	
func _on_customer_1_at_desk() -> void:
	_generate_order()

func _on_customer_2_at_desk() -> void:
	_generate_order()

func _on_customer_3_at_desk() -> void:
	_generate_order()
