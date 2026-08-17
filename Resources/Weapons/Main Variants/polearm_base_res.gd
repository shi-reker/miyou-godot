extends Weapon_base
class_name Polearm_base

@export var subType:Transformations

func _init() -> void:
	dmg = 35.0
	atkSpeed = 0.7
	crit = 5.0
	critMulti = 1.8
	atkDur = 0.4
	type = WeaponTypes.POLEARM
	hitboxDims = [10, 60]

enum Transformations {
	HALBERD, 
	SPEAR, 
	STAFF, 
	GUANDAO, 
	CANE, 
	SANJIEGUN, 
	NAGINATA
}
