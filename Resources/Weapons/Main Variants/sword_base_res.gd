extends Weapon_base
class_name Sword_base

enum Transformations {
	LONGSWORD,
	ESTOC,
	STRAIGHT_SWORD,
	FLYING_SWORD,
	BLADE,
	SHUANG_GOU, 
	ODACHI
}

@export var subType:Transformations = Transformations.LONGSWORD:
	set(value):
		subType = value
		_apply_stats()

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.LONGSWORD: [1.4, 5.0, 1.5],
	Transformations.ESTOC: [1.3, 7.0, 1.8],
	Transformations.STRAIGHT_SWORD: [1.4, 5.0, 1.5],
	Transformations.FLYING_SWORD: [1.5, 6.0, 1.5],
	Transformations.BLADE: [1.6, 4.0, 1.5],
	Transformations.SHUANG_GOU: [1.5, 5.0, 1.6],
	Transformations.ODACHI: [1.25, 4.5, 2.0],
}

func _init() -> void:
	dmg = 35.0
	type = WeaponTypes.SWORD
	hitboxDims = [10, 40]
	_apply_stats()

func _apply_stats() -> void:
	var stats: Array = statVariants[subType]
	atkSpeed = stats[0]
	crit = stats[1]
	critMulti = stats[2]
