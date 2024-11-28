extends RigidBody3D

@export var speed_modifier = 25
@export var turn_rate = 5
@export var jump_modifier = 5

@export var floor_check: RayCast3D

@export var respawn_point: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var force = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		force -= transform.basis.z * speed_modifier
	if Input.is_action_pressed("move_backward"):
		force += transform.basis.z * speed_modifier

	apply_central_force(force)
	
	if Input.is_action_pressed("turn_left"):
		rotate_y(turn_rate * delta)
	if Input.is_action_pressed("turn_right"):
		rotate_y(-turn_rate * delta)

	if floor_check:
		var on_floor = floor_check.is_colliding()
		
		if Input.is_action_just_released("jump") and on_floor:
			apply_central_impulse(Vector3.UP * jump_modifier)
			
	if respawn_point and global_position.y < - 15:
		global_transform = respawn_point.global_transform
