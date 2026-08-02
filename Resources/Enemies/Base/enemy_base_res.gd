extends Resource
class_name Enemy_base

@export var health:float
@export var defense:float
@export var speed:float
@export var jumpTime:float
@export var jumpHeight:float
@export var fallSpeed:float
@export var type:MainType
@export var subType:SubType

var isGrounded:bool = false
var isJumping:bool = false

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

enum SubType {
	ZOMBIE,
	JIANGSHI,
	DECAYED,
	SKELETON,
	LICH,
	DULLAHAN,
	AMALGAM
}
