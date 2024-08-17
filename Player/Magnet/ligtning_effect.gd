extends Node2D
@onready var player := get_tree().get_nodes_in_group("player")[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	visible = get_parent().held
	
	global_position = (get_parent().global_position + player.global_position)/2

	scale.y = (get_parent().global_position - player.global_position).length()
	
	global_rotation = (get_parent().global_position - player.global_position).angle() + PI/2
