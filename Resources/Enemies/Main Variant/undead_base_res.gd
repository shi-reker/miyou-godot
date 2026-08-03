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
