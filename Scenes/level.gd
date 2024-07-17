extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# 1. we need to load the scene:
var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
func _on_meteor_timer_timeout():
	# 2. create an instance:
	var meteor = meteor_scene.instantiate()
	# 3. attach node to the current tree:
	$Meteros.add_child(meteor)
