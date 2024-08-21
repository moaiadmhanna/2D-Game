extends CharacterBody2D
@export var speed := 700
@export var stamina = 100;
@export var health = 100;
signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,200)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	if(direction != Vector2.ZERO):
		stamina -= 5 * delta
	else:
		stamina += 10 * delta
	stamina = clamp(stamina, 0, 100)
	if(stamina > 0):
		velocity = direction * speed
		move_and_slide()
	# Shooting mechanics 
	if Input.is_action_pressed("shoot"):
		if $CoolDownTimer.is_stopped():
			$CoolDownTimer.start()
			laser.emit($LaserStartPos.global_position)
	

func _on_cool_down_timer_timeout():
	$CoolDownTimer.stop()
