extends Node2D

var fruit = preload("res://Scenes/apple.tscn")
var dropPos = Vector2.ZERO
var isDropped = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dropPos = $Dropper.position
	dropPos.y += 20
	$Platform.get_signal_list()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print_tree_pretty()
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
