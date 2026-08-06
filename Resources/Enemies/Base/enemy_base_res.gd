extends Resource
class_name Enemy_base

@export var health:float
@export var defense:float
@export var attack:float
@export var mana:float
@export var speed:float
@export var jumpHeight:float

var type:MainType

enum MainType {
	UNDEAD,
	DEMI,
	DAEMON,
	DEVIL,
	SPIRIT,
	MECHANICA,
	HUMAN,
	FOREIGN
}
