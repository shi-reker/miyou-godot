extends Weapon_base
class_name Polearm_base

enum Transformations {
	HALBERD, 
	SPEAR, 
	STAFF, 
	GUANDAO, 
	CANE, 
	SANJIEGUN, 
	NAGINATA
}

@export var subType:Transformations = Transformations.HALBERD:
	set(value):
		subType = value
		_apply_stats()

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.HALBERD: [1.25, 6.0, 1.5],
	Transformations.SPEAR: [1.3, 6.0, 1.6],
	Transformations.STAFF: [1.35, 4.0, 1.4],
	Transformations.GUANDAO: [1.2, 3.0, 1.6],
	Transformations.CANE: [1.25, 6.0, 1.2],
	Transformations.SANJIEGUN: [1.35, 6.0, 1.2],
	Transformations.NAGINATA: [1.25, 5.0, 1.5],
}

func _init() -> void:
	dmg = 35.0
	type = WeaponTypes.POLEARM
	hitboxDims = [10, 60]
	_apply_stats()

func _apply_stats() -> void:
	var stats: Array = statVariants[subType]
	atkSpeed = stats[0]
	crit = stats[1]
	critMulti = stats[2]
