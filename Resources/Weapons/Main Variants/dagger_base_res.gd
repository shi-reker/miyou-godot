extends Weapon_base
class_name Dagger_base

@export var subType:Transformations

func _init() -> void:
	dmg = 15.0
	atkSpeed = 1.4
	crit = 8.0
	critMulti = 1.3
	atkDur = 0.2
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
