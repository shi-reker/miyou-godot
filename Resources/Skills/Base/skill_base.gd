extends Resource
class_name Skill_base

@export var cd:float
@export var dur:float
@export var dmg:float
@export var maxCharge:int

var source:Player
var target:Variant
var prog = -1
var cdTimer = -1
var charge = maxCharge

func activate() -> void:
	pass

func tick(_delta: float) -> void:
	pass
