extends Resource
class_name Weapon_base

@export var alignment:Allegiance
@export var sprite:Texture2D
@export var hitboxDims:Array
var dmg:float
var atkSpeed:float
var crit:float
var critMulti:float
var type:WeaponTypes

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

var transformations:Dictionary[WeaponTypes, Array] = {
	WeaponTypes.SWORD: [
		"longsword", "estoc", "straight sword", "flying sword", 
		"blade", "shuang gou", "odachi", "longsword"
		],
	WeaponTypes.DAGGER: [
		"bowie knife", "butterfly swords", "rope dagger", "stakes", 
		"throwing knives", "sai", "blink dagger", "bowie knife"
		],
	WeaponTypes.POLEARM: [
		"halberd", "spear", "staff", "guandao", 
		"cane", "sanjiegun", "naginata", "spear"
		],
	WeaponTypes.UNARMED: [
		"fist-palm", "fist-leg", "palm-leg", "fist", 
		"leg", "finger", "aura hand", "fist"
		],
	WeaponTypes.FIREARM: [
		"shotgun", "rifle", "dual pistols", "rail", 
		"smg", "cards", "bow", "rifle"
		],
	WeaponTypes.DEX: [
		"rings", "chakram", "haladie", "flying knives", 
		"needles", "wire", "claws", "chakram"
		],
	WeaponTypes.HEAVY: [
		"zweihander", "glaive", "dual cleaver", "greatsword", 
		"launcher", "scythe", "ring blade", "greatsword"
		]
}
