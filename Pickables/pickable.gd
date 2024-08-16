extends RigidBody2D
class_name Pickable

@onready var held: bool = false
@onready var mouse_in: bool = false
@export var held_damping: float = 2.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("magnet") && mouse_in:
		held = true
	
	if held == true:
		gravity_scale = 0
		apply_central_force((get_global_mouse_position() - global_position) * 10)
		set_collision_layer_value(3, false) #Disable Pickable Layer
		set_collision_layer_value(5, true) #Enable Held Layer
		set_collision_mask_value(1, false) #Disable Player Mask
		set_collision_mask_value(3, false) #Disable Pickable Mask
		set_collision_mask_value(5, true) #Enable Held Mask
		linear_damp = held_damping
		add_to_group("held")
	else:
		gravity_scale = 1
		set_collision_layer_value(5, false) #Disable Held Layer
		set_collision_layer_value(3, true) #Enable PIckable Layer
		set_collision_mask_value(5, false) #Disable Held Mask
		set_collision_mask_value(1, true) #Enable Player Mask
		set_collision_mask_value(3, true) #Enable PIckable Mask
		linear_damp = 0
		remove_from_group("held")
	
	if $PickableRayCast.is_colliding():
		pass#held = false


func _on_mouse_entered() -> void:
	mouse_in = true

func _on_mouse_exited() -> void:
	mouse_in = false
