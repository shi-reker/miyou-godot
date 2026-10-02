extends Weapon_base
class_name Dex_base

@export var subType:Transformations

func _init() -> void:
	dmg = 15.0
	atkSpeed = statVariants[subType][0]
	crit = statVariants[subType][1]
	critMulti = statVariants[subType][2]
	type = WeaponTypes.DEX
	hitboxDims = [15, 15]

enum Transformations {
	RINGS, 
	CHAKRAM, 
	HALADIE, 
	FLYING_KNIVES, 
	NEEDLES, 
	WIRE, 
	CLAWS
}

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.RINGS: [1.6, 3.0, 1.6],
	Transformations.CHAKRAM: [1.8, 4.0, 1.6],
	Transformations.HALADIE: [1.5, 5.0, 1.5],
	Transformations.FLYING_KNIVES: [2.0, 8.0, 1.2],
	Transformations.NEEDLES: [1.8, 12.0, 1.1],
	Transformations.WIRE: [1.8, 3.0, 1.6],
	Transformations.CLAWS: [1.6, 4.0, 1.6],
}
