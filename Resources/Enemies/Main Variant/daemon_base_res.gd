extends Enemy_base
class_name Daemon_base

@export var subType:SubType

func _init():
	type = MainType.DAEMON

enum SubType {
	GOBLIN,
	IMP,
	REVENANT,
	HOUND,
	ORK,
	OGRE,
	CHIMERA,
	DOPPEL,
	FALLEN
}
