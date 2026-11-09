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

func activate() -> void:
	match skillName:
		SkillCodes.INSTANT_STRIKE: 
			prog = 0
		SkillCodes.DOUBLE_IMPACT: 
			prog = 0
		SkillCodes.PARRY: 
			prog = 0
		SkillCodes.UNSTOPPABLE: 
			prog = 0
		SkillCodes.PENETRATING_STRIKE: 
			prog = 0
		SkillCodes.CLOSE_CALL: 
			prog = 0
		SkillCodes.FORCE_STRIKE: 
			prog = 0
		SkillCodes.PURSUIT: 
			prog = 0
		SkillCodes.FOCUSED_INTENT: 
			prog = 0

func tick(delta: float) -> void:
	match skillName:
		SkillCodes.INSTANT_STRIKE:
			InstantStrike()
		SkillCodes.DOUBLE_IMPACT:
			DoubleImpact()
		SkillCodes.PARRY:
			Parry()
		SkillCodes.UNSTOPPABLE:
			Unstoppable()
		SkillCodes.PENETRATING_STRIKE:
			PenStrike()
		SkillCodes.CLOSE_CALL:
			CloseCall()
		SkillCodes.FORCE_STRIKE:
			ForceStrike()
		SkillCodes.PURSUIT:
			Pursuit()
		SkillCodes.FOCUSED_INTENT:
			FocusedIntent()
