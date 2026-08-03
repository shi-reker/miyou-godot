extends Enemy_base
class_name Devil_base

@export var subType:SubType

func _init():
	type = MainType.DEVIL

enum SubType {
	SUCCUBUS,
	NIGHTMARE,
	VAMPIRE,
	GREATER,
	HIGH,
	ARCH,
	TRUE
}
