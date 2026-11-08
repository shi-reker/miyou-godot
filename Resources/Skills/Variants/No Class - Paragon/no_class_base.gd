extends Skill_base
class_name NoClass_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	GRAPPLING_HOOK,
	DASH,
	DOUBLE_JUMP,
	HORSE_KICK,
	STRENGTHEN,
	BULWARK,
	UNCHAINED_FORCE,
	ORIGIN_FORCE,
	COLLECTOR,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func GrapplingHook():
	pass
func Dash():
	var xMove = source.xMove
	var dashVal = 1000
	if prog >= 0 and prog <= dur:
		if xMove < 0:
			xMove -= dashVal
		else:
			xMove += dashVal
	else:
		prog = -1
	
	return xMove
func DoubleJump():
	pass
func HorseKick():
	pass
func Strengthen():
	pass
func Bulwark():
	pass
func UnchainedForce():
	pass
func OriginForce():
	pass
func Collector():
	pass

func def() -> void:
	sName = skillName
	skillFuncs = {
		SkillCodes.GRAPPLING_HOOK: GrapplingHook,
		SkillCodes.DASH: Dash,
		SkillCodes.DOUBLE_JUMP: DoubleJump,
		SkillCodes.HORSE_KICK: HorseKick,
		SkillCodes.STRENGTHEN: Strengthen,
		SkillCodes.BULWARK: Bulwark,
		SkillCodes.UNCHAINED_FORCE: UnchainedForce,
		SkillCodes.ORIGIN_FORCE: OriginForce,
		SkillCodes.COLLECTOR: Collector,
	}
