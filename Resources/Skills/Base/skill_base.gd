extends Resource
class_name Skill_base

@export var cd:float
@export var dur:float
@export var dmg:float
@export var charge:int

var source:Player
var target
var prog
var cdTimer = 0

func def():
	pass
