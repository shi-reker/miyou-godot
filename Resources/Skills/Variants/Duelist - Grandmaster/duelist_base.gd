extends Skill_base
class_name Duelist_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	INSTANT_STRIKE,
	DOUBLE_IMPACT,
	PARRY,
	UNSTOPPABLE,
	PENETRATING_STRIKE,
	CLOSE_CALL,
	FORCE_STRIKE,
	PURSUIT,
	FOCUSED_INTENT,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func InstantStrike():
	pass
func DoubleImpact():
	pass
func Parry():
	pass
func Unstoppable():
	pass
func PenStrike():
	pass
func CloseCall():
	pass
func ForceStrike():
	pass
func Pursuit():
	pass
func FocusedIntent():
	pass

var skillFuncs: Dictionary[SkillCodes, Callable] = {
	SkillCodes.INSTANT_STRIKE: InstantStrike,
	SkillCodes.DOUBLE_IMPACT: DoubleImpact,
	SkillCodes.PARRY: Parry,
	SkillCodes.UNSTOPPABLE: Unstoppable,
	SkillCodes.PENETRATING_STRIKE: PenStrike,
	SkillCodes.CLOSE_CALL: CloseCall,
	SkillCodes.FORCE_STRIKE: ForceStrike,
	SkillCodes.PURSUIT: Pursuit,
	SkillCodes.FOCUSED_INTENT: FocusedIntent,
}
