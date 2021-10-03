extends Button

var hidden
var textEdit
var executeBtn

func _ready():
	textEdit = get_node("../textEdit")
	executeBtn = get_node("../execute")
	
	hidden = true
	textEdit.visible = not hidden
	executeBtn.visible = not hidden

func _on_showHide_pressed():
	hidden = not hidden
	textEdit.visible = not hidden
	executeBtn.visible = not hidden
