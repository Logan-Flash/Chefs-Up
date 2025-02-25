extends Node

var tips = 0
var complaints = 0
@export var max_complaints = 3
signal leaves
signal satisfied
signal background
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emit_signal("background")
	_update_complaints_counter_label()
	_update_tip_counter_label_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _recieve_tip():
	tips += 1
	emit_signal("satisfied")
	_update_tip_counter_label_text()
	
func _update_tip_counter_label_text():
	$TipCounter.text = "Tips: " + str(tips)

func _on_order_tray_1_complete_order() -> void:
	_recieve_tip()

func _on_order_tray_2_complete_order() -> void:
	_recieve_tip()

func _on_order_tray_3_complete_order() -> void:
	_recieve_tip()
	
func _recieve_complaint():
	complaints += 1
	_update_complaints_counter_label()
	if complaints == max_complaints:
		#add_child(load("res://GameOver.tscn").instantiate())
		$GameOver.visible = true
		$GameOver.process_mode = Node.PROCESS_MODE_ALWAYS
		$GameOver/Label.text += "\n" + $TipCounter.text
		get_tree().paused = true

func _update_complaints_counter_label():
	$ComplaintsCounter.text = "Complaints: " + str(complaints) + "/" + str(max_complaints)

func _on_customer_1_frustrated() -> void:
	_recieve_complaint()
	$Order1._clear_order()
	emit_signal("leaves")

func _on_customer_2_frustrated() -> void:
	_recieve_complaint()
	$Order2._clear_order()
	emit_signal("leaves")

func _on_customer_3_frustrated() -> void:
	_recieve_complaint()
	$Order3._clear_order()
	emit_signal("leaves")


func _on_customer_getting_angry() -> void:
	pass # Replace with function body.
