extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_background_music():
	$"Background Music".play()

func stop_background_music():
	$"Background Music".stop()

func play_fired():
	$Fired.play()

func play_leaving():
	$Leaving.play()

func play_frustrated():
	$"Getting Frustrated".play()

func play_satisfied():
	$Satisfied.play()
