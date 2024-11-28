extends AnimatableBody3D

@export var rotation_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	rotate_object_local(Vector3.UP, rotation_speed * delta)
