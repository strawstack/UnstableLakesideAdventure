extends Node

var win = false

func run_code(code_string):
	
	code_string = code_string.split("\n")

	# Remove comments
	var lines = []
	for line in code_string:
		var line_trim = line.strip_edges()
		if line_trim[0] != "#":
			lines.append(line)

	# Build program as string
	code_string = ""
	for line in lines:
		code_string += line + "\n\t"

	var source = "extends Node2D\nfunc eval(root):\n\t" + code_string

	var script = GDScript.new()
	script.set_source_code(source)
	script.reload()

	var obj = Node2D.new()
	obj.set_script(script)
	obj.eval(self)

func _process(delta):
	if win:
		get_tree().change_scene("res://win.tscn")
