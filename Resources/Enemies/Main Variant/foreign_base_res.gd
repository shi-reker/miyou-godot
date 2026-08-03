extends Enemy_base
class_name Foreign_base

@export var subType:SubType

func _init():
	type = MainType.FOREIGN

enum SubType {
	PRIMORDIAL,
	ASCENDANT,
	GOD
}
