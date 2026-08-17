extends Weapon_base
class_name Sword_base

@export var subType:Transformations

func _init() -> void:
	dmg = 35.0
	atkSpeed = 0.8
	crit = 6.5
	critMulti = 1.6
	atkDur = 0.4
	type = WeaponTypes.SWORD
	hitboxDims = [10, 40]

enum Transformations {
	LONGSWORD,
	ESTOC,
	STRAIGHT_SWORD,
	FLYING_SWORD,
	BLADE,
	SHUANG_GOU, 
	ODACHI
}
