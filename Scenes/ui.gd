extends CanvasLayer
static var image = load("res://PNG/UI/playerLife3_blue.png")
var timeElapsed : int = 0
func set_health(amount):
	# remove all children 
	for child in $LifesMargin/HBoxContainer.get_children():
		child.queue_free()
	# create new children and the amount is set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$LifesMargin/HBoxContainer.add_child(text_rect)
func set_score(amount):
	$ScoreMargin/Score.text = str(amount)


func _on_scoret_imer_timeout():
	timeElapsed += 1
	$ScoreMargin/Score.text = str(timeElapsed)
	Global.score = timeElapsed
