extends StaticBody2D

var moving = false

func _process(delta: float) -> void:
	if moving:
		pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(viewport, event, shape_idx)
	if event is InputEventMouseButton:
		if event.button_index == 1:
			moving = true
		elif event.button_index == 4:
			rotate(-PI/24)
		elif event.button_index == 5:
			rotate(PI/24)
