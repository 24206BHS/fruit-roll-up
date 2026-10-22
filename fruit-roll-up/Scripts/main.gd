extends Node2D

var fruit = preload("res://Scenes/apple.tscn")
var dropPos = Vector2.ZERO
var isDropped = false
var time = 0.0
var playing = true
var next = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control.visible = true
	$Control/Win.visible = false
	dropPos = $Dropper.position
	dropPos.y += 20
	$Control/Win/Panel/NextLevel.pressed.connect(_on_next_level_pressed)
	$Control/Win/Panel/Retry.pressed.connect(_on_retry_pressed)
	$Control/Retry.pressed.connect(_on_retry_pressed)
	$Control/Pause.pressed.connect(_on_pause_pressed)
	$Control/Drop.pressed.connect(_on_drop)
	next = "res://Scenes/level_"+str(int(get_tree().current_scene.scene_file_path[19])+1)+".tscn"
	if !FileAccess.file_exists(next):
		next = "res://Scenes/main.tscn"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_on_drop()
	if playing:
		time+=delta
		$Control/Win/Panel/Label.text = "You win!\nTime taken: "+str(snapped(time, 0.01))+"s"

func _on_drop() -> void:
	if isDropped:
		for i in get_tree().get_nodes_in_group("Fruit"):
			i.queue_free()
	var child = fruit.instantiate()
	child.position = dropPos
	self.add_child(child)
	isDropped = true

func _on_platform_movement() -> void:
	if isDropped:
		for i in get_tree().get_nodes_in_group("Fruit"):
			i.queue_free()

func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()

func _on_next_level_pressed() -> void:
	get_tree().change_scene_to_file(next)

func _on_pause_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
