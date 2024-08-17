extends Node2D
@export var view_distance: float = 200.0
@export_range(0, 1, 0.05) var mouse_distance_threshold: float = 0.75

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var diff_vector: Vector2 = get_global_mouse_position() - get_parent().global_position
	var dist_offset: float = clamp(diff_vector.length()/view_distance, 0, 1)
	if dist_offset < mouse_distance_threshold:
		dist_offset = 0
	position = diff_vector.normalized() * view_distance * dist_offset
