extends Area2D

func _ready():
	var randomNumber := RandomNumberGenerator.new()
	# start Poisiton:
	var width = get_viewport().get_visible_rect().size[0]
	var xPosition = randomNumber.randi_range(0,width)
	var yPoistion = randomNumber.randi_range(-50,-150)
	position = Vector2(xPosition,yPoistion)
	
func _process(delta):
	position += Vector2(0,1.0) * 400 * delta
	
func _on_body_entered(body):
	body.health -= 10;
	body.health = clamp(body.health,0,100)
	print(body.health)
