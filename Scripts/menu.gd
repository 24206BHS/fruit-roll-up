extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_level_select_button_pressed() -> void:
	$LevelSelect.visible = true
