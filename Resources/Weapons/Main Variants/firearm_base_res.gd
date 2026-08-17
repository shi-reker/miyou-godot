extends Weapon_base
class_name Firearm_base

@export var subType:Transformations

func _init() -> void:
	dmg = 4.0
	atkSpeed = 2.0
	crit = 2.0
	critMulti = 2.0
	atkDur = 0.1
	type = WeaponTypes.FIREARM
	hitboxDims = [15, 15]

enum Transformations {
	SHOTGUN, 
	RIFLE, 
	DUAL_PISTOLS, 
	RAIL, 
	SMG, 
	CARDS, 
	BOW
}
