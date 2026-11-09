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

func activate() -> void:
	match skillName:
		SkillCodes.SPRINT:
			prog = 0
		SkillCodes.FOLLOW_UP:
			prog = 0
		SkillCodes.STING:
			prog = 0
		SkillCodes.OVERCLOCK:
			prog = 0
		SkillCodes.ACROBATICS:
			prog = 0
		SkillCodes.BLINK_RECALL:
			prog = 0
		SkillCodes.SUBSTITUTION:
			prog = 0
		SkillCodes.AMBUSH:
			prog = 0
		SkillCodes.SIXTH_SENSE:
			prog = 0

func tick(delta: float) -> void:
	match skillName:
		SkillCodes.SPRINT:
			Sprint()
		SkillCodes.FOLLOW_UP:
			FollowUp()
		SkillCodes.STING:
			Sting()
		SkillCodes.OVERCLOCK:
			Overclock()
		SkillCodes.ACROBATICS:
			Acrobat()
		SkillCodes.BLINK_RECALL:
			BlinkRecall()
		SkillCodes.SUBSTITUTION:
			Substitution()
		SkillCodes.AMBUSH:
			Ambush()
		SkillCodes.SIXTH_SENSE:
			sixSense()
