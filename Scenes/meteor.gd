extends Area2D


func _on_body_entered(body):
	body.health -= 10;
	body.health = clamp(body.health,0,100)
	print(body.health)
