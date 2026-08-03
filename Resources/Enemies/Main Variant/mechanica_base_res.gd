extends Enemy_base
class_name Mechanica_base

@export var subType:SubType

func _init():
	type = MainType.MECHANICA

enum SubType {
	DROID,
	ANIMATRONIC,
	CYBORG,
	LEGION,
	ARKANIA,
	ANOV
}
