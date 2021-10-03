extends Node2D

var currentTile
var tileSize = Vector2(16, 16)
var isMoving
var isTyping

func _ready():
	isTyping = false
	isMoving = false
	currentTile = positionToTile(position)

func _process(delta):
	if not isMoving and not isTyping:
		if Input.is_action_pressed("up"):
			movePlayer(currentTile + Vector2(0, -1))
			
		if Input.is_action_pressed("right"):
			movePlayer(currentTile + Vector2(1, 0))
			
		if Input.is_action_pressed("down"):
			movePlayer(currentTile + Vector2(0, 1))
			
		if Input.is_action_pressed("left"):
			movePlayer(currentTile + Vector2(-1, 0))

func positionToTile(position):
	return position / tileSize

func tileToPosition(tile):
	return tile * tileSize

func movePlayer(targetTile):
	isMoving = true
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
			tileToPosition(currentTile), tileToPosition(targetTile), 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	currentTile = targetTile
	tween.start()

func _on_Tween_tween_completed(object, key):
	isMoving = false
