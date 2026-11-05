extends Skill_base
class_name No_class_skill_base

@export var baseSkillName:SkillCodes

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

func GrapplingHook():
	pass
func Dash():
	pass
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

var skillFuncs: Dictionary[SkillCodes, Callable] = {
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
