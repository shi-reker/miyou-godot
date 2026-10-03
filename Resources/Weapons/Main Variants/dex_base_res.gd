extends Weapon_base
class_name Dex_base

enum Transformations {
	RINGS, 
	CHAKRAM, 
	HALADIE, 
	FLYING_KNIVES, 
	NEEDLES, 
	WIRE, 
	CLAWS
}

@export var subType:Transformations = Transformations.RINGS:
	set(value):
		subType = value
		_apply_stats()


var statVariants:Dictionary[Transformations, Array] = {
	Transformations.RINGS: [1.6, 3.0, 1.6],
	Transformations.CHAKRAM: [1.8, 4.0, 1.6],
	Transformations.HALADIE: [1.5, 5.0, 1.5],
	Transformations.FLYING_KNIVES: [2.0, 8.0, 1.2],
	Transformations.NEEDLES: [1.8, 12.0, 1.1],
	Transformations.WIRE: [1.8, 3.0, 1.6],
	Transformations.CLAWS: [1.6, 4.0, 1.6],
}

func _init() -> void:
	dmg = 15.0
	type = WeaponTypes.DEX
	hitboxDims = [15, 15]
	_apply_stats()

func _apply_stats() -> void:
	var stats: Array = statVariants[subType]
	atkSpeed = stats[0]
	crit = stats[1]
	critMulti = stats[2]
