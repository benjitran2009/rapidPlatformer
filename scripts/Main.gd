extends Node2D

@export var EnemyTimer: Timer
@export var Enemy: PackedScene
@export var Cd: float = 5;

# Called when the node enters the scene tree for the first time.

func generatePosition(toChange: Transform2D) -> void:
	var playerX = $Player.transform.position.x
	var playerY = $Player.transform.position.y
	var x = randi_range(20,240);
	var y = randi_range(20,240);
	var multX = 1 if randi_range(1,2)%2 else -1;
	var multY = 1# if randi_range(1,2)%2 else -1;
	#if positive:
	toChange.x = playerX+(x*multX)
	toChange.y = playerY+(y*multY)
	#else:
	#	return 

func _ready() -> void:
	EnemyTimer.start(Cd)
	pass # Replace with function body.

func spawnEnemy():
	var e: Node = Enemy.instantiate()
	#var b = Bullet.instantiate()
	add_child(e)
	generatePosition(e.transform)#ector2()
	#$CharacterBody2D.global_transform
	#owner.add_child(b)
	pass

func _on_enemy_timeout() -> void:
	spawnEnemy()
	EnemyTimer.start(Cd)
	pass # Replace with function body.
