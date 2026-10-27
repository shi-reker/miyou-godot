extends TextureRect
class_name Select_item_gen

var selItem = preload("res://Scenes/selection_slot.tscn")

@export var grid:GridContainer
@export var title:Label
@export var subtitle:Label
@export var conf:Label

var classPaths:Dictionary[Class_base.Classes, Array] = {
	Class_base.Classes.VANGUARD: ["vanguard", "res://Resources/Classes/Variants/vanguard_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.DUELIST: ["duelist", "res://Resources/Classes/Variants/duelist_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.SKIRMISHER: ["skirmisher", "res://Resources/Classes/Variants/skirmisher_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.ARTILLERY: ["artillery", "res://Resources/Classes/Variants/artillery_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.RANGER: ["ranger", "res://Resources/Classes/Variants/ranger_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.SPECIALIST: ["specialist", "res://Resources/Classes/Variants/specialist_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.STRIKER: ["striker", "res://Resources/Classes/Variants/striker_res.tres", "res://Assets/Icons/Weapons/Polearm.png"],
	Class_base.Classes.NOCLASS: ["no_class", "res://Resources/Classes/Variants/no_class_res.tres", "res://Assets/Icons/Weapons/Polearm.png"]
}

signal change_class(path:String)
signal change_selected_item()

func _ready() -> void:
	print_debug("3")
	var a = 0
	while a < 8:
		var newItem:Selection_item = selItem.instantiate() as Selection_item
		change_selected_item.connect(newItem._on_other_pressed)
		newItem.confirmed.connect(_on_class_selected)
		newItem.Setup(a, classPaths[a][0], classPaths[a][2])
		newItem.spawner = self
		grid.add_child(newItem)
		a+=1

func _on_class_selected(code:int):
	get_tree().paused = false
	change_class.emit(classPaths[code][1])
	queue_free()
