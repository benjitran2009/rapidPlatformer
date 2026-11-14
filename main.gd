extends CharacterBody2D

@export var speed = 400
@export var gravity = 2
@onready var ground = $"./"
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func calculate_gravity():
	if (move_and_collide())

func _physics_process(delta):
	get_input()
	move_and_slide()
