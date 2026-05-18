extends Node2D

var fruit = preload("res://Scenes/apple.tscn")
var dropPos = Vector2.ZERO
var isDropped = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dropPos = $Dropper.position
	dropPos.y += 20

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if isDropped:
			get_node("Apple").queue_free()
		var child = fruit.instantiate()
		child.position = dropPos
		child.name = "Apple"
		self.add_child(child)
		isDropped = true
