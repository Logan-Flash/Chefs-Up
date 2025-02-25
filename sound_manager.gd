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


func _on_game_scene_leaves() -> void:
	play_leaving()

func _on_game_over_fired() -> void:
	play_fired()


func _on_game_scene_satisfied() -> void:
	play_satisfied()


func _on_game_scene_background() -> void:
	start_background_music()


func _on_customer_getting_angry() -> void:
	play_frustrated()
