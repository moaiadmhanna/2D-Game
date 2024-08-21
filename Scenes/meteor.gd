extends Area2D
var speed : int
var roatationSpeed : int
var directionX : float

signal collision
signal bodyExited

func _ready():
	var randomNumberGenrator := RandomNumberGenerator.new()
	# start Poisiton:
	var width = get_viewport().get_visible_rect().size[0]
	var xPosition = randomNumberGenrator.randi_range(0,width)
	var yPoistion = randomNumberGenrator.randi_range(-50,-150)
	position = Vector2(xPosition,yPoistion)
	# Speed / roatationSpeed / direction
	speed = randomNumberGenrator.randi_range(200,500)
	directionX = randomNumberGenrator.randf_range(-1,1)
	roatationSpeed = randomNumberGenrator.randi_range(40,100)
	# Texture
	var textures = ["res://PNG/Meteors/meteorBrown_big1.png","res://PNG/Meteors/meteorBrown_med3.png","res://PNG/Meteors/meteorGrey_big1.png","res://PNG/Meteors/meteorGrey_med1.png","res://PNG/Meteors/meteorGrey_small1.png"]
	var path : String = textures[randomNumberGenrator.randi_range(0,4)]
	$Sprite2D.texture = load(path)
	
func _process(delta):
	position += Vector2(directionX,1.0) * speed * delta
	rotation_degrees += roatationSpeed * delta
	
func _on_body_entered(body):
	collision.emit(body)

func _on_body_exited(body):
	bodyExited.emit(body)
	
func _on_area_entered(area):
	area.queue_free()
	queue_free()
