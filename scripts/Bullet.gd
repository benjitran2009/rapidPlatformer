extends Area2D

var speed = 750
var bounchSfx = preload("res://assets/jump.wav")

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		return
	if body.is_in_group("Enemy"):
		body.health-=5
		#ody.queue_free();
		#free()
		if body.health<=0:
			body.queue_free();
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = bounchSfx
		$AudioStreamPlayer2D.play()
	transform.x*=-1
	#queue_free()
