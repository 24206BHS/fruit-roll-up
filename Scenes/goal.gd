extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(256,0,0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("a")
	if body.is_in_group("Fruit"):
		print("b")
		modulate = Color(0,256,0)
