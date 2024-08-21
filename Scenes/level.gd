extends Node2D
# 1. we need to load the scene:
var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://bullet.tscn")
var randomNumberGenrator := RandomNumberGenerator.new()
var health : int = 3
var score : int  = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the health bar 
	get_tree().call_group("ui","set_health",health)
	get_tree().call_group("ui","set_score",score)
	$MeteorTimer.start()
	var size := get_viewport().get_visible_rect().size
	var stars = $Stars.get_children()
	for star in stars:
		# position
		var xPosition = randomNumberGenrator.randf_range(50,size.x)
		var yPoistion = randomNumberGenrator.randf_range(50,size.y)
		star.position = Vector2(xPosition,yPoistion)
		
		# scale 
		#var randomScale = randomNumberGenrator.randf_range(1,2)
		#star.scale = Vector2(randomScale,randomScale)
		
		# speed 
		star.speed_scale = randomNumberGenrator.randf_range(0.6,1.4)

func _on_meteor_timer_timeout():
	# 2. create an instance:
	var meteor = meteor_scene.instantiate()
	# 3. attach node to the current tree:
	$Meteros.add_child(meteor)
	#connect the signal
	meteor.connect("collision",_on_meteor_collision)
	meteor.connect("bodyExited",_on_meteor_body_exited)
func _on_meteor_body_exited(body):
	print(body)
func _on_meteor_collision(body):
	if body.name == "Player":
		health -= 1
		get_tree().call_group("ui","set_health",health)
		if health <= 0:
			get_tree().change_scene_to_file("res://Scenes/gameover_screen.tscn")

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
func _process(delta):
	for child in $Meteros.get_children():
		if child.position.y > get_viewport().get_visible_rect().size.y:
			child.queue_free()

