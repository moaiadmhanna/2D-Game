extends Area2D
var speed = 1000;
# Called when the node enters the scene tree for the first time
func _ready():
	$Sprite2D.scale = Vector2(0,0)
	var tween = create_tween()
	tween.tween_property($Sprite2D,"scale",Vector2(1,1),0.2).from(Vector2(0,0))
func _physics_process(delta):
	position.y -= speed * delta
