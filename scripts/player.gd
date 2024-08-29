extends CharacterBody2D

@export var move_speed : float = 75
@onready var animation = $AnimatedSprite2D
func _physics_process(_delta):
	
	# Key direction
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)
	print(input_direction)
	
	if Input.get_action_strength("right") - Input.get_action_strength("left") == 1: 
			animation.play("walkright")
	elif Input.get_action_strength("right") - Input.get_action_strength("left") == -1:
		animation.play("walkleft")
	elif Input.get_action_strength("down") - Input.get_action_strength("up") == 1:
		animation.play("walkdown")
	elif Input.get_action_strength("down") - Input.get_action_strength("up") == -1:
		animation.play("walkup")
	else:
		animation.play("idle")
	
	# Speed
	velocity = input_direction * move_speed
	# move and slide
	move_and_slide()
