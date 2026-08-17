extends Weapon_base
class_name Heavy_base

@export var subType:Transformations

func _init() -> void:
	dmg = 45.0
	atkSpeed = 0.4
	crit = 4.0
	critMulti = 2.2
	atkDur = 0.8
	type = WeaponTypes.HEAVY
	hitboxDims = [15, 40]

enum Transformations {
	ZWEIHANDER, 
	GLAIVE, 
	DUAL_CLEAVER, 
	GREATSWORD, 
	LAUNCHER, 
	SCYTHE, 
	RING_BLADE
}
