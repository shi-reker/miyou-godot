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
	if prog >= 0 and prog <= dur:
		#print_debug(prog)
		if source.xMove < 0:
			print_debug("dash left")
			#print_debug(source.xMove)
			source.xMoveBonus -= 600
		else:
			print_debug("dash right")
			#print_debug(source.xMove)
			source.xMoveBonus += 600
	else:
		prog = -1
		cdTimer = cd
		source.xMoveBonus = 0
		print_debug(cdTimer)
		#charge -= 1

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

func activate() -> void:
	match skillName:
		SkillCodes.GRAPPLING_HOOK:
			prog = 0
		SkillCodes.DASH:
			prog = 0
		SkillCodes.DOUBLE_JUMP:
			prog = 0
		SkillCodes.HORSE_KICK:
			prog = 0
		SkillCodes.STRENGTHEN:
			prog = 0
		SkillCodes.BULWARK:
			prog = 0
		SkillCodes.UNCHAINED_FORCE:
			prog = 0
		SkillCodes.ORIGIN_FORCE:
			prog = 0
		SkillCodes.COLLECTOR:
			prog = 0

func tick(delta: float) -> void:
	match skillName:
		SkillCodes.GRAPPLING_HOOK:
			GrapplingHook()
		SkillCodes.DASH:
			Dash()
		SkillCodes.DOUBLE_JUMP:
			DoubleJump()
		SkillCodes.HORSE_KICK:
			HorseKick()
		SkillCodes.STRENGTHEN:
			Strengthen()
		SkillCodes.BULWARK:
			Bulwark()
		SkillCodes.UNCHAINED_FORCE:
			UnchainedForce()
		SkillCodes.ORIGIN_FORCE:
			OriginForce()
		SkillCodes.COLLECTOR:
			Collector()
