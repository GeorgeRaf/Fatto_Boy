extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP = -500
const ACCELERATION = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += GRAVITY
	
	#movement to the Right or Left
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		#input animation and position changes
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
		motion.x = 0
	
	#movement to initiate jumping
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, UP)
	pass

