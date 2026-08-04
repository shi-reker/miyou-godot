extends Enemy_base
class_name Undead_base

@export var subType:SubType

func _init() -> void:
	type = MainType.UNDEAD

enum SubType {
	ZOMBIE,
	JIANGSHI,
	DECAYED,
	SKELETON,
	LICH,
	DULLAHAN,
	AMALGAM
}

var spritePaths:Dictionary[SubType, String] = {
	SubType.ZOMBIE: "res://Assets/Sprites/Enemies/Undead/zombie.png",
	SubType.JIANGSHI: "",
	SubType.DECAYED: "",
	SubType.SKELETON: "",
	SubType.LICH: "",
	SubType.DULLAHAN: "",
	SubType.AMALGAM: ""
}
