extends Node

@export var RoundTimerDisplay : Label
@export var time = 5
var current_time
signal round_end

func _ready() -> void:
	_reset_timer()

func _process(delta: float) -> void:
	_update_timer(delta)
		
func _update_timer(delta: float):
	current_time -= delta
	if current_time <= 0:
		_signal_round_end()
	RoundTimerDisplay.text = "%0.2f" % current_time
	
func _reset_timer():
	current_time = time

func _signal_round_end():
	emit_signal("round_end")
		
func _on_round_end():
	_reset_timer()

func _on_end_round_button_pressed() -> void:
	_signal_round_end()
