extends StaticBody2D

var dragging = false
var rotating = false
var moving = false
var mouse = Vector2.ZERO #Previous mouse position for platform moving
var offset = Vector2.ZERO #Offset of mouse from platform when moving

#func _process(delta: float) -> void:
	#if dragging:
		#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#position += (mouse-position)-offset
			#mouse = get_global_mouse_position()
		#else:
			#dragging = false
	#if rotating:
		#if moving:
			#rotating = false
		#else:
			#print(InputEventMouseButton)
			#if Input.get_mouse_button_mask():
				#rotate(-PI/24)
				#print("right")
			#elif Input.is_action_just_pressed("ui_text_scroll_up"):
				#rotate(PI/24)
				#print("left")
		#print("in")

func _input(event: InputEvent) -> void:
	if dragging:
		if event is InputEventMouseMotion and event.button_mask == 1:
			position += (mouse-position)-offset
			mouse = get_global_mouse_position()
	if rotating:
		if event is InputEventMouseMotion:
			rotating = false
		elif event is InputEventMouseButton:
			if event.button_index == 4:
				rotate(-PI/24)
			elif event.button_index == 5:
				rotate(PI/24)
			

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(viewport, event, shape_idx)
	if event is InputEventMouseButton:
		if event.button_index == 1:
			dragging = true
			mouse = get_global_mouse_position()
			offset = mouse-position
		elif event.button_index == 4 or event.button_index == 5:
			rotating = true
		else:
			dragging = false
