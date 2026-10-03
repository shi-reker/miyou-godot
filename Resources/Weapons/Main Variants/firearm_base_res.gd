extends Weapon_base
class_name Firearm_base

enum Transformations {
	SHOTGUN, 
	RIFLE, 
	DUAL_PISTOLS, 
	RAIL, 
	SMG, 
	CARDS, 
	BOW
}

@export var subType:Transformations = Transformations.SHOTGUN:
	set(value):
		subType = value
		_apply_stats()

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.SHOTGUN: [3.6, 1.6, 1.2],
	Transformations.RIFLE: [8.0, 2.3, 1.1],
	Transformations.DUAL_PISTOLS: [6.0, 2.0, 1.2],
	Transformations.RAIL: [1.6, 4.0, 1.8],
	Transformations.SMG: [16.0, 1.6, 1.1],
	Transformations.CARDS: [4.0, 5.0, 1.3],
	Transformations.BOW: [2.0, 6.0, 1.6],
}

func _init() -> void:
	dmg = 4.0
	type = WeaponTypes.FIREARM
	hitboxDims = [15, 15]
	_apply_stats()

func _apply_stats() -> void:
	var stats: Array = statVariants[subType]
	atkSpeed = stats[0]
	crit = stats[1]
	critMulti = stats[2]
