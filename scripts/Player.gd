extends CharacterBody2D

@export var Bullet: PackedScene
@export var Cd: float = 0.25
@export var ShootingTimer: Timer

var run_speed = 350
var jump_speed = -1000
var gravity = 2500

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Gun/Muzzle.global_transform

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('right')
	var left = Input.is_action_pressed('left')
	var jump = Input.is_action_just_pressed('jump')
	var shootPressed = Input.is_action_pressed('shoot')
	
	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	if (shootPressed) and (not ShootingTimer.time_left > 0):
		ShootingTimer.start(0.5)
	

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()


func _on_shooting_timeout() -> void:
	shoot()
	ShootingTimer.stop()
	pass # Replace with function body.
