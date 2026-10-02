extends Weapon_base
class_name Firearm_base

@export var subType:Transformations

func _init() -> void:
	dmg = 4.0
	atkSpeed = statVariants[subType][0]
	crit = statVariants[subType][1]
	critMulti = statVariants[subType][2]
	type = WeaponTypes.FIREARM
	hitboxDims = [15, 15]
	print_debug(subType)

enum Transformations {
	SHOTGUN, 
	RIFLE, 
	DUAL_PISTOLS, 
	RAIL, 
	SMG, 
	CARDS, 
	BOW
}

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.SHOTGUN: [3.6, 1.6, 1.2],
	Transformations.RIFLE: [12.0, 2.3, 1.1],
	Transformations.DUAL_PISTOLS: [6.0, 2.0, 1.2],
	Transformations.RAIL: [1.6, 4.0, 1.8],
	Transformations.SMG: [20.0, 1.6, 1.1],
	Transformations.CARDS: [4.0, 5.0, 1.3],
	Transformations.BOW: [2.0, 6.0, 1.6],
}
