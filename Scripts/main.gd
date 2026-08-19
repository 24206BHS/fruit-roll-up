extends Node2D

var fruit = preload("res://Scenes/apple.tscn")
var dropPos = Vector2.ZERO
var isDropped = false
var time = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dropPos = $Dropper.position
	dropPos.y += 20

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_on_drop()
	time+=delta
	$Win/Panel/Label.text = "You win!\nTime taken: "+str(snapped(time, 0.01))+"s"

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
