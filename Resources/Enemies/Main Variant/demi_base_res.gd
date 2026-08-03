extends Enemy_base
class_name Demi_base

@export var subType:SubType

func _init():
	type = MainType.DEMI

enum SubType {
	BEASTMAN,
	DRACONIAN,
	INSECTOID,
	WARE,
	MERMAN,
	FAIRY,
	ELF
}
