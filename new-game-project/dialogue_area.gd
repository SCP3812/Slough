extends Area3D

@onready var player = get_node("/root/MainScene/Player")
@export var dialogue_key = ""
var area_active = false

func _input(event):
	if area_active and event.is_action_pressed("ui_accept"): 
		SignalBus.emit_signal('display_dialogue', dialogue_key)
	else: 
		pass	

func _on_area_entered(area: Area3D):
	area_active = true
	
func _on_area_exited(area: Area3D):
	area_active = false
