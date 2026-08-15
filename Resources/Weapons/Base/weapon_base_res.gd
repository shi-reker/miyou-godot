extends Resource
class_name Weapon_base

@export var dmg:float
@export var atkSpeed:float
@export var crit:float
@export var critMulti:float
@export var atkDur:float
@export var type:WeaponTypes
@export var alignment:Allegiance
@export var attributes:Array
@export var effects:Array
@export var sprite:Texture2D

enum WeaponTypes {
	SWORD,
	DAGGER,
	HEAVY,
	FIREARM,
	DEX,
	UNARMED,
	POLEARM,
	NONE
}

enum Allegiance {
	FRIENDLY,
	HOSTILE,
	NONE
}

var collAndSpriteSizes:Dictionary[WeaponTypes, Array] = {
	WeaponTypes.SWORD: [10, 40],
	WeaponTypes.DAGGER: [5, 25],
	WeaponTypes.HEAVY: [15, 40],
	WeaponTypes.FIREARM: [15, 15],
	WeaponTypes.DEX: [15, 15],
	WeaponTypes.UNARMED: [20, 25],
	WeaponTypes.POLEARM: [10, 60],
	WeaponTypes.NONE: [0,0]
}

var transformations:Dictionary[WeaponTypes, Array] = {
	WeaponTypes.SWORD: ["Longsword", "Estoc", "Straight Sword", "Flying Sword", "Blade", "Shuang gou", "Odachi"],
	WeaponTypes.DAGGER: ["Bowie Knife", "Butterfly Swords", "Rope Dagger", "Stakes", "Throwing Knives", "Sai", "Blink Dagger"],
	WeaponTypes.POLEARM: ["Halberd", "Spear", "Staff", "Guandao", "Cane", "Sanjiegun", "Naginata"],
	WeaponTypes.UNARMED: ["Fist-Palm", "Fist-Leg", "Palm-Leg", "Fist", "Leg", "Finger", "Aura hand"],
	WeaponTypes.FIREARM: ["Shotgun", "Rifle", "Dual Pistols", "Rail", "SMG", "Cards", "Bow"],
	WeaponTypes.DEX: ["Rings", "Chakram", "Haladie", "Flying Knives", "Needles", "Wire", "Claws"],
	WeaponTypes.HEAVY: ["Zweihander", "Glaive", "Dual Cleaver", "Greatsword", "Launcher", "Scythe", "Ring Blade"]
}
