extends TextureButton
class_name Selection_item

@export var icon:TextureRect
@export var title:Label
@export var outline:TextureRect

var spawner:Select_item_gen
var classCode:Class_base.Classes
var isSelected:bool = false
var isJustClicked:bool = false

signal confirmed(code:int)

func Setup(code:Class_base.Classes, t:String, i:String):
	classCode = code
	icon.texture = load(i)
	title.text = t
	outline.hide()

func _on_other_pressed():
	if isJustClicked:
		isSelected = true
		isJustClicked = false
	else:
		isSelected = false
		outline.hide()

func _on_pressed() -> void:
	if isSelected:
		confirmed.emit(classCode)
	else:
		isJustClicked = true
		outline.show()
		spawner.change_selected_item.emit()
		#get_parent().change_selected_item.emit()
