extends Node2D
class_name World

var selector = preload("res://Scenes/selection_overlay.tscn")

@export var player:Player

func _ready() -> void:
	pass
	
func SelectClass():
	var selectionLayer = CanvasLayer.new()
	selectionLayer.process_mode = PROCESS_MODE_ALWAYS
	var overlay:Select_item_gen = selector.instantiate() as Select_item_gen
	overlay.change_class.connect(_on_class_changed)
	selectionLayer.add_child(overlay)
	get_tree().root.add_child(selectionLayer)
	get_tree().paused = true
	print_debug("2")

func _on_class_changed(path:String):
	player.Setup(path)

func _on_texture_button_pressed() -> void:
	SelectClass()
