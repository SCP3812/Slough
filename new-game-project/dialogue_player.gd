extends CanvasLayer

@export_file("*.json") var scene_text_file
@onready var gui = get_parent().get_parent()

var scene_text = {}
var selected_text = []
var in_progress = false
@onready var background = $Background
@onready var text_label = $TextLabel

func _ready():
	gui.visible = false
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.connect('display_dialogue', on_display_dialogue)
	
func parse_json(text):
	return JSON.parse_string(text)

func load_scene_text(): 
	var file = FileAccess.open(scene_text_file,  FileAccess.READ)
	var content_as_text = file.get_as_text()
	var content_as_dictionary = parse_json(content_as_text)
	return content_as_dictionary
	

func show_text():
	text_label.text = selected_text.pop_front()
	print(selected_text)
	
func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()
		
func finish():
	text_label.text = ""
	background.visible = false
	gui.visible = false
	in_progress = false
	
func on_display_dialogue(text_key):
	if in_progress:
		next_line()
	else:
		gui.visible = true
		background.visible = true
		in_progress = true
		print(text_key)
		selected_text = scene_text[text_key].duplicate()
	
	
