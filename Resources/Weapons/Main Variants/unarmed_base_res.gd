extends Weapon_base
class_name Unarmed_base

enum Transformations {
	FIST_PALM, 
	FIST_LEG, 
	PALM_LEG, 
	FIST, 
	LEG, 
	FINGER, 
	AURA_HAND
}

@export var subType:Transformations = Transformations.FIST_PALM:
	set(value):
		subType = value
		_apply_stats()

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.FIST_PALM: [1.6, 8.0, 1.2],
	Transformations.FIST_LEG: [1.8, 10.0, 1.4],
	Transformations.PALM_LEG: [1.6, 8.0, 1.3],
	Transformations.FIST: [2.4, 10.0, 1.4],
	Transformations.LEG: [2.2, 10.0, 1.6],
	Transformations.FINGER: [1.8, 6.0, 1.6],
	Transformations.AURA_HAND: [2.4, 6.0, 1.8],
}

func _init() -> void:
	dmg = 25.0
	type = WeaponTypes.UNARMED
	hitboxDims = [20, 25]
	_apply_stats()

func _apply_stats() -> void:
	var stats: Array = statVariants[subType]
	atkSpeed = stats[0]
	crit = stats[1]
	critMulti = stats[2]
