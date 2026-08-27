extends Control

func _ready() -> void:
	$LevelSelect.visible = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_level_select_button_pressed() -> void:
	$LevelSelect.visible = true

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")

func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_4.tscn")

func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_5.tscn")

func _on_level_6_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_6.tscn")

func _on_level_7_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_7.tscn")

func _on_level_8_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_8.tscn")
