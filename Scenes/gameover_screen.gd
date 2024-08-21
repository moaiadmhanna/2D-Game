extends Control
@export var level : PackedScene

func _ready():
	$CenterContainer/VBoxContainer/Label2.text += str(Global.score)
	if Global.highScore <= Global.score:
		Global.highScore = Global.score
	$CenterContainer/VBoxContainer/Label3.text += str(Global.highScore)
func _process(delta):
	if Input.is_action_just_pressed("Replay"):
		get_tree().change_scene_to_packed(level)
