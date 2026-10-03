extends Weapon_base
class_name Heavy_base

enum Transformations {
	ZWEIHANDER, 
	GLAIVE, 
	DUAL_CLEAVER, 
	GREATSWORD, 
	LAUNCHER, 
	SCYTHE, 
	RING_BLADE
}

@export var subType:Transformations = Transformations.ZWEIHANDER:
	set(value):
		subType = value
		_apply_stats()

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.ZWEIHANDER: [1.0, 7.0, 1.7],
	Transformations.GLAIVE: [1.2, 5.0, 1.6],
	Transformations.DUAL_CLEAVER: [1.2, 8.0, 1.4],
	Transformations.GREATSWORD: [0.7, 8.5, 2.2],
	Transformations.LAUNCHER: [1.0, 3.0, 2.2],
	Transformations.SCYTHE: [0.9, 6.0, 2.4],
	Transformations.RING_BLADE: [1.0, 4.0, 2.0],
}

func _init() -> void:
	dmg = 45.0
	type = WeaponTypes.HEAVY
	hitboxDims = [15, 40]
	_apply_stats()

func _apply_stats() -> void:
	var stats: Array = statVariants[subType]
	atkSpeed = stats[0]
	crit = stats[1]
	critMulti = stats[2]
