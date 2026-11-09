extends Resource
class_name Skill_base

@export var cd:float
@export var dur:float
@export var dmg:float
@export var charge:int

var source:Player
var target:Variant
var prog = 0
var cdTimer = 0

func activate() -> void:
	pass

func tick(_delta: float) -> void:
	pass
