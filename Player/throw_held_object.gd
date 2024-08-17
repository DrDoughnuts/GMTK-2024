extends Node2D
@export var throw_speed: float = 800.0
@onready var drop_timer: float = 0
@onready var drop_time_threshold: float = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var held_group := get_tree().get_nodes_in_group("held")
	if Input.is_action_just_released("throw") && held_group.size() > 0:
		var thrown : Pickable = held_group[0]
		thrown.held = false
		thrown.linear_velocity = Vector2(0,0)
		thrown.apply_central_impulse((get_global_mouse_position() - global_position).normalized() * throw_speed)
		$SfxRelease.play()
	if Input.is_action_pressed("throw"):
		drop_timer += delta
		if drop_timer > drop_time_threshold:
			if held_group.size() > 0:
				$SfxDeactivate.play()
			for i in held_group:
				i.held = false
	else:
		drop_timer = 0
