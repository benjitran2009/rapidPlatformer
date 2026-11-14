extends Node2D

@export var EnemyTimer: Timer
@export var Enemy: PackedScene
@export var Cd: float = 5;
@onready var PlayerSprite = $Player;

# Called when the node enters the scene tree for the first time.

func generatePosition(toChange) -> void:
	var playerX = $Player.position.x
	var playerY = $Player.position.y
	var x = randi_range(20,240);
	var y = randi_range(20,240);
	var multX = 1 if randi_range(1,2)%2 else -1;
	var multY = 1# if randi_range(1,2)%2 else -1;
	toChange.x = playerX + (multX*x)
	toChange.y = playerY + (multY*y)
	#if positive:
	#toChange += Vector2() playerX+(x*multX)
	#toChange.y = playerY+(y*multY)
	#else:
	#	return 

func _ready() -> void:
	EnemyTimer.start(Cd)
	pass # Replace with function body.

func spawnEnemy():
	var e: Node = Enemy.instantiate()
	#var b = Bullet.instantiate()
	add_child(e)
	generatePosition(e.position)#ector2()
	#$CharacterBody2D.global_transform
	#owner.add_child(b)
	pass

func _process(delta: float) -> void:
	$Player/FPS.text = "FPS: %s" % (1/delta)

func _on_enemy_timeout() -> void:
	spawnEnemy()
	EnemyTimer.start(Cd)
	pass # Replace with function body.
