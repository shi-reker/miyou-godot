extends Weapon_base
class_name Heavy_base

@export var subType:Transformations

func _init() -> void:
	dmg = 45.0
	atkSpeed = statVariants[subType][0]
	crit = statVariants[subType][1]
	critMulti = statVariants[subType][2]
	type = WeaponTypes.HEAVY
	hitboxDims = [15, 40]

enum Transformations {
	ZWEIHANDER, 
	GLAIVE, 
	DUAL_CLEAVER, 
	GREATSWORD, 
	LAUNCHER, 
	SCYTHE, 
	RING_BLADE
}

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.ZWEIHANDER: [1.0, 7.0, 1.7],
	Transformations.GLAIVE: [1.2, 5.0, 1.6],
	Transformations.DUAL_CLEAVER: [1.2, 8.0, 1.4],
	Transformations.GREATSWORD: [0.7, 8.5, 2.2],
	Transformations.LAUNCHER: [1.0, 3.0, 2.2],
	Transformations.SCYTHE: [0.9, 6.0, 2.4],
	Transformations.RING_BLADE: [1.0, 4.0, 2.0],
}
