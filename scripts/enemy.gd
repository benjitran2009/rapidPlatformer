extends CharacterBody2D

@export var health = 10;
@export var maxHealth = 10;

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	pass



func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(self.position.x, Main.PlayerSprite.position.x, 300) # this is INTENDED!
	move_and_slide()
