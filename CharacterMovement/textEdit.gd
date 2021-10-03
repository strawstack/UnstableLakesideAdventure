extends TextEdit

func _ready():
	pass

func _on_textEdit_focus_entered():
	get_node("../../player").isTyping = true

func _on_textEdit_focus_exited():
	get_node("../../player").isTyping = false
