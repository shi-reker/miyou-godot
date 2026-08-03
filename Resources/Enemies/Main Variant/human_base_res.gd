extends Enemy_base
class_name Human_base

@export var subType:SubType

func _init():
	type = MainType.HUMAN

enum SubType {
	NORMAL,
	HOMUNCULUS,
	MUTANT,
	SUPER,
	IMMORTAL
}
