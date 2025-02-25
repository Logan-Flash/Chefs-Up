extends Node2D

signal frustrated
@onready var pathFollow = $Path/PathFollow
var speed = 1
var leaving = false
var frustration = 0
var patience_level = 0

func _ready() -> void:
	_new_customer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if pathFollow.progress != 256 or leaving:
		$Path/PathFollow/AnimatedSprite2D.play()
		$Path/PathFollow/AnimatedSprite2D.animation = "Walk"
		pathFollow.progress += speed 
	elif pathFollow.progress == 256:
		$Path/PathFollow/AnimatedSprite2D.animation = "Idle"
		
	if pathFollow.progress_ratio == 1:
		_new_customer()
	
func _new_customer():
	leaving = false
	pathFollow.progress_ratio = 0
	frustration = 0
	patience_level = randi_range(2, 4)
	$Path/PathFollow/AnimatedSprite2D.speed_scale = 1

func _on_order_tray_1_complete_order() -> void:
	leaving = true # Replace with function body.

func _on_order_tray_2_complete_order() -> void:
	leaving = true # Replace with function body.

func _on_order_tray_3_complete_order() -> void:
	leaving = true # Replace with function body.

func _on_round_timer_round_end() -> void:
	frustration += 1
	if frustration == patience_level/2:
		$Path/PathFollow/AnimatedSprite2D.speed_scale = 1.5
	elif frustration == patience_level:
		$Path/PathFollow/AnimatedSprite2D.speed_scale = 2
	elif frustration > patience_level:
		leaving = true
		emit_signal("frustrated")
		
