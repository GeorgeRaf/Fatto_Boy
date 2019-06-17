extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP = -500
const ACCELERATION = 50
const MAX_SPEED = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	#movement to the Right or Left
	if Input.is_action_pressed("ui_right"):
		motion.x += ACCELERATION
		motion.x = min(motion.x, MAX_SPEED)
		#input animation and position changes
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x -= ACCELERATION
		motion.x = max(motion.x, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
		#smooth slide when stoping motion
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	
	#movement to initiate jumping
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
		if friction ==true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		#when in the air
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		if friction ==true:
			motion.x = lerp(motion.x, 0, 0.1)
	
	motion = move_and_slide(motion, UP)
	pass

