extends Weapon_base
class_name Unarmed_base

@export var subType:Transformations

func _init() -> void:
	dmg = 25.0
	atkSpeed = 1.2
	crit = 10.0
	critMulti = 1.3
	atkDur = 0.2
	type = WeaponTypes.UNARMED
	hitboxDims = [20, 25]

enum Transformations {
	FIST_PALM, 
	FIST_LEG, 
	PALM_LEG, 
	FIST, 
	LEG, 
	FINGER, 
	AURA_HAND
}
