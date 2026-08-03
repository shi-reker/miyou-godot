extends Enemy_base
class_name Spirit_base

@export var subType:SubType

func _init():
	type = MainType.SPIRIT

enum SubType {
	GHOST,
	BANSHEE,
	REAPER,
	MANIFESTATION,
	GUARDIAN,
	CELESTIAL,
	EXALTED
}
