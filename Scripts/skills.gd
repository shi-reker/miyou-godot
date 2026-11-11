extends Node2D
class_name Skill_processor

@export var skill:Skill_base
@export var player:Player

var isExecuting:bool = false
var onCooldown:bool = false
var dlt:float

func _ready() -> void:
	skill.source = player
	skill.charge = skill.maxCharge

func _physics_process(delta: float) -> void:
	dlt = delta
	
	if skill.prog < 0 and skill.cdTimer < 0:
		pass
	elif skill.prog >= 0:
		skill.prog += delta
		ProgressSkill(delta)
	else:
		if skill.cdTimer == skill.cd:
			skill.cdTimer -= delta
			isExecuting = false
			onCooldown = true
			print_debug("CD")
		elif skill.cdTimer > 0:
			skill.cdTimer -= delta
			CheckCooldown()

func CheckCooldown():
	if skill.cdTimer <= 0:
		onCooldown = false
		skill.prog = -1
		skill.cdTimer = -1
		print_debug("refresh")

func ActivateSkill(from:Variant, to:Variant):
	print_debug("1")
	print_debug(isExecuting, onCooldown, skill.charge)
	if isExecuting or skill.charge <= 0 or onCooldown:
		return
	print_debug("2")
	skill.source = from
	skill.target = to
	skill.activate()
	isExecuting = true

func ProgressSkill(delta:float):
	skill.tick(delta)
