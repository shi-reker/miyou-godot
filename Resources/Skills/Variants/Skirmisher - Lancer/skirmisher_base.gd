extends Skill_base
class_name Skirmisher_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	SPRINT,
	FOLLOW_UP,
	STING,
	OVERCLOCK,
	ACROBATICS,
	BLINK_RECALL,
	SUBSTITUTION,
	AMBUSH,
	SIXTH_SENSE,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func Sprint():
	pass
func FollowUp():
	pass
func Sting():
	pass
func Overclock():
	pass
func Acrobat():
	pass
func BlinkRecall():
	pass
func Substitution():
	pass
func Ambush():
	pass
func sixSense():
	pass

var skillFuncs: Dictionary[SkillCodes, Callable] = {
	SkillCodes.SPRINT: Sprint,
	SkillCodes.FOLLOW_UP: FollowUp,
	SkillCodes.STING: Sting,
	SkillCodes.OVERCLOCK: Overclock,
	SkillCodes.ACROBATICS: Acrobat,
	SkillCodes.BLINK_RECALL: BlinkRecall,
	SkillCodes.SUBSTITUTION: Substitution,
	SkillCodes.AMBUSH: Ambush,
	SkillCodes.SIXTH_SENSE: sixSense,
}
