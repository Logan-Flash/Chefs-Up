extends Node

var tips = 0
var complaints = 0
@export var max_complaints = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Order1.order = ["Burger", "Burger"]
	$Order1._set_label_text()
	$Order2.order = ["Burger", "Burger"]
	$Order2._set_label_text()
	$Order3.order = ["Burger", "Burger"]
	$Order3._set_label_text()
	
	_update_complaints_counter_label()
	_update_tip_counter_label_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _recieve_tip():
	tips += 1
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
		add_child(load("res://GameOver.tscn").instantiate())
		$GameOver.visible = true
		$GameOver/Label.text += "\n" + $TipCounter.text
		get_tree().paused = true

func _update_complaints_counter_label():
	$ComplaintsCounter.text = "Complaints: " + str(complaints) + "/" + str(max_complaints)
