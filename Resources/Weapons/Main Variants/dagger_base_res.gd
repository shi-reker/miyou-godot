extends Weapon_base
class_name Dagger_base

@export var subType:Transformations

func _init() -> void:
	dmg = 15.0
	atkSpeed = statVariants[subType][0]
	crit = statVariants[subType][1]
	critMulti = statVariants[subType][2]
	type = WeaponTypes.DAGGER
	hitboxDims = [5, 25]

enum Transformations {
	BOWIE_KNIFE,
	BUTTERFLY_SWORDS,
	ROPE_DAGGER,
	STAKES,
	THROWING_KNIVES,
	SAI,
	BLINK_DAGGER
}

var statVariants:Dictionary[Transformations, Array] = {
	Transformations.BOWIE_KNIFE: [1.5, 6.5, 1.4],
	Transformations.BUTTERFLY_SWORDS: [1.6, 5.0, 1.2],
	Transformations.ROPE_DAGGER: [1.2, 10.0, 1.3],
	Transformations.STAKES: [1.35, 6.0, 1.5],
	Transformations.THROWING_KNIVES: [1.35, 6.0, 1.3],
	Transformations.SAI: [1.6, 8.0, 1.5],
	Transformations.BLINK_DAGGER: [1.5, 8.0, 1.5],
}
