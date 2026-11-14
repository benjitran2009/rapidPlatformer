extends CharacterBody2D

@export var Bullet: PackedScene
var run_speed = 350
var jump_speed = -1000
var gravity = 2500

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.transform

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('right')
	var left = Input.is_action_pressed('left')
	var jump = Input.is_action_just_pressed('jump')
	var shootPressed = Input.is_action_just_pressed('shoot')
	
	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	if shootPressed:
		shoot()
	

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()
