extends CharacterBody2D

@export var SPEED: float = 75.0
@onready var sprite = $AnimatedSprite2D
@onready var animator = $AnimationPlayer
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
	
	spritePlayer(X_direction, Y_direction)
	move_and_slide()

func spritePlayer(x, y):
	if !y:
		y += 10
	if x == 1:
		y *= 5
	if x == -1:
		y *= 2
	if y == -1:
		animator.play("WalkUp")
	elif y == 1:
		animator.play("WalkDown")
	elif y == 50:
		animator.play("WalkRight")
	elif y == 20:
		animator.play("WalkLeft")
	elif y == -2:
		animator.play("WalkUpLeft")
	elif y == 2:
		animator.play("WalkDownLeft")
	elif y == -5:
		animator.play("WalkUpRight")
	elif y == 5:
		animator.play("WalkDownRight")
	else:
		animator.play("Idle")
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
