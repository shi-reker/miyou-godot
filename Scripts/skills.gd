extends Node2D
class_name Skill_processor

@export var skill:Skill_base
@export var player:Player

var isExecuting:bool = false
var dlt:float

func _physics_process(delta: float) -> void:
	dlt = delta
	
	if skill.prog < 0 and skill.cdTimer < 0:
		pass
	elif skill.prog >= 0:
		ProgressSkill(delta)
	else:
		if skill.cdTimer == skill.cd:
			isExecuting = false
		elif skill.cdTimer > 0:
			CheckCooldown(delta)

func CheckCooldown(delta:float):
	skill.cdTimer -= delta
	if skill.cdTimer <= 0:
		skill.prog = -1
		skill.cdTimer = -1

func ActivateSkill(from:Variant, to:Variant):
	if isExecuting:
		return
	skill.source = player
	skill.target = to
	skill.activate()
	isExecuting = true

func ProgressSkill(delta:float):
	skill.prog += delta
	skill.tick(delta)
