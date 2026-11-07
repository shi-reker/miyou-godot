extends Node2D
class_name Skill_processor

@export var skill:Skill_base
@export var player:Player

var isExecuting:bool = false

func _physics_process(delta: float) -> void:
	if skill.prog < 0 and skill.cdTimer > 0:
		CheckCooldown(delta)
	elif skill.prog >= 0:
		ProgressSkill(delta)

func CheckCooldown(delta:float):
	skill.cdTimer -= delta
	if skill.prog < 0 and skill.cd <= 0:
		skill.prog = 0
		skill.cdTimer = 0

func ProgressSkill(delta:float):
	skill.prog += delta
	skill.skillFuncs[skill.skillName].call()

func ActivateSkill(from:Variant, to:Variant):
	if isExecuting:
		return
	skill.source = player
	skill.target = to
	skill.skillFuncs[skill.skillName].call()
	skill.cdTimer = skill.cd
	isExecuting = true
