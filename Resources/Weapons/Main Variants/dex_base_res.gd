extends Weapon_base
class_name Dex_base

@export var subType:Transformations

func _init() -> void:
	dmg = 15.0
	atkSpeed = 1.8
	crit = 3.0
	critMulti = 1.8
	atkDur = 0.15
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
