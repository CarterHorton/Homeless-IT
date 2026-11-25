extends CharacterBody2D

@export var SPEED: float = 30.0
var InitialSpeed = SPEED

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var X_direction := Input.get_axis("ui_left", "ui_right")
	var Y_direction := Input.get_axis("ui_up", "ui_down")
	
	# Is sprinting
	if Input.is_action_pressed("Sprint"):
		SPEED = InitialSpeed * 2.5
	else:
		SPEED = InitialSpeed
		
		
	if X_direction && Y_direction:
		velocity.x = X_direction * (SPEED * sqrt(2) / 2)
		velocity.y = Y_direction * (SPEED * sqrt(2) / 2)
	elif X_direction:
		velocity.x = X_direction * SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
	elif Y_direction:
		velocity.y = Y_direction * SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
