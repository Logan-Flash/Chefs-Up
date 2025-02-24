extends Label

var tips = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_label_text()

func _recieve_tip():
	tips += 1
	_update_label_text()
	
func _update_label_text():
	text = "Tips: " + str(tips)

func _on_order_tray_1_complete_order() -> void:
	_recieve_tip()

func _on_order_tray_2_complete_order() -> void:
	_recieve_tip()

func _on_order_tray_3_complete_order() -> void:
	_recieve_tip()
