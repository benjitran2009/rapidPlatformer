extends CharacterBody2D

@export var health = 10;
@export var maxHealth = 10;

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var deathDialog: AcceptDialog = Main.DeathDialog;
var hitHurt = preload("res://assets/hitHurt.wav")

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider():
			if collision.get_collider().is_in_group("Player"):
				collision.get_collider().health-=1
				if !$AudioStreamPlayer2D.is_playing():
					$AudioStreamPlayer2D.stream = hitHurt
					$AudioStreamPlayer2D.play()
				if (collision.get_collider().health<=0):
					get_tree().quit()
					#Main.PlayerSprite.queue_free()
					#deathDialog.visible = true
					#eval("1/0");

func _process(delta: float) -> void:
	# Add the gravity.
	#if Vector2(position).distance_to(Main.PlayerSprite.position) <= 16:
	#	Main.PlayerHP-=5;
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(self.position.x, Main.PlayerSprite.position.x, 300) # this is INTENDED!
	move_and_slide()
