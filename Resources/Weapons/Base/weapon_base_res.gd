extends Resource
class_name Weapon_base

@export var dmg:float
@export var atkSpeed:float
@export var crit:float
@export var critMulti:float
@export var type:WeaponTypes
@export var alignment:Allegiance
@export var attributes:Array
@export var effects:Array
@export var sprite:String
#@export var objSize:

enum WeaponTypes {
	SWORD,
	DAGGER,
	HEAVY,
	FIREARM,
	DEX,
	UNARMED,
	POLEARM
}

enum Allegiance {
	FRIENDLY,
	HOSTILE
}

var collAndSpriteSizes:Dictionary[WeaponTypes, Array] = {
	WeaponTypes.SWORD: [10, 40],
	WeaponTypes.DAGGER: [5, 25],
	WeaponTypes.HEAVY: [15, 40],
	WeaponTypes.FIREARM: [15, 15],
	WeaponTypes.DEX: [15, 15],
	WeaponTypes.UNARMED: [20, 25],
	WeaponTypes.POLEARM: [10, 60]
}
