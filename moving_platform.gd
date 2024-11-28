extends AnimatableBody3D

@export var movement_extent: float = 5.0
@export var move_speed: float = 2.0

var start_position: Vector3
var moving_forth = true
var current_offset = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = transform.origin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving_forth:
		current_offset += move_speed * delta
		if current_offset >= movement_extent:
			current_offset = movement_extent
			moving_forth = false
	else:
		current_offset -= move_speed * delta
		if current_offset <= 0:
			current_offset = 0
			moving_forth = true
	
	transform.origin = start_position + transform.basis.x * current_offset
