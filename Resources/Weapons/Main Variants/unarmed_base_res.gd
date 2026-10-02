extends Weapon_base
class_name Unarmed_base

@export var subType:Transformations

func _init() -> void:
	dmg = 25.0
	atkSpeed = statVariants[subType][0]
	crit = statVariants[subType][1]
	critMulti = statVariants[subType][2]
	type = WeaponTypes.UNARMED
	hitboxDims = [20, 25]

enum Transformations {
	FIST_PALM, 
	FIST_LEG, 
	PALM_LEG, 
	FIST, 
	LEG, 
	FINGER, 
	AURA_HAND
}

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.FIST_PALM: [1.6, 8.0, 1.2],
	Transformations.FIST_LEG: [1.8, 10.0, 1.4],
	Transformations.PALM_LEG: [1.6, 8.0, 1.3],
	Transformations.FIST: [2.4, 10.0, 1.4],
	Transformations.LEG: [2.2, 10.0, 1.6],
	Transformations.FINGER: [1.8, 6.0, 1.6],
	Transformations.AURA_HAND: [2.4, 6.0, 1.8],
}
