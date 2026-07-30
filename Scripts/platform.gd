extends StaticBody2D

var dragging = false
var rotating = false
var mouse = Vector2.ZERO #Previous mouse position for platform moving
var offset = Vector2.ZERO #Offset of mouse from platform when moving

signal movement #Signal to tell fruit to delete when the player moves a platform

func _input(event: InputEvent) -> void:
	if dragging:
		if event is InputEventMouseMotion and event.button_mask == 1:
			position += (mouse-position)-offset
			mouse = get_global_mouse_position()
		else:
			dragging = false
	if rotating:
		if event is InputEventMouseMotion:
			rotating = false
		elif event is InputEventMouseButton:
			if event.button_index == 4:
				rotate(-PI/24)
			elif event.button_index == 5:
				rotate(PI/24)

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	#print(viewport, event, shape_idx)
	if event is InputEventMouseButton:
		if event.button_index == 1:
			dragging = true
			mouse = get_global_mouse_position()
			offset = mouse-position
			movement.emit()
		elif event.button_index == 4 or event.button_index == 5:
			rotating = true
			movement.emit()
		else:
			dragging = false
