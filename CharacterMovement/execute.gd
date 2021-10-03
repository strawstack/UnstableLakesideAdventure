extends Button

func _on_execute_pressed():
	var code_string = get_node("../textEdit").get_text()
	get_node("../..").run_code(code_string)
