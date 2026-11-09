extends Skill_base
class_name Striker_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	BARRAGE,
	KILLER_INSTINCT,
	VITAL_STRIKE,
	BLOODLUST,
	EXECUTION,
	SURA,
	ANNIHILATION,
	SOUL_STRIKE,
	FIRST_STRIKE,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func Barrage():
	pass
func KillerInstinct():
	pass
func VitalStrike():
	pass
func Bloodlust():
	pass
func Execution():
	pass
func Sura():
	pass
func Annihilation():
	pass
func SoulStrike():
	pass
func FirstStrike():
	pass

func activate() -> void:
	match skillName:
		SkillCodes.BARRAGE:
			prog = 0
		SkillCodes.KILLER_INSTINCT:
			prog = 0
		SkillCodes.VITAL_STRIKE:
			prog = 0
		SkillCodes.BLOODLUST:
			prog = 0
		SkillCodes.EXECUTION:
			prog = 0
		SkillCodes.SURA:
			prog = 0
		SkillCodes.ANNIHILATION:
			prog = 0
		SkillCodes.SOUL_STRIKE:
			prog = 0
		SkillCodes.FIRST_STRIKE:
			prog = 0

func tick(delta: float) -> void:
	match skillName:
		SkillCodes.BARRAGE:
			Barrage()
		SkillCodes.KILLER_INSTINCT:
			KillerInstinct()
		SkillCodes.VITAL_STRIKE:
			VitalStrike()
		SkillCodes.BLOODLUST:
			Bloodlust()
		SkillCodes.EXECUTION:
			Execution()
		SkillCodes.SURA:
			Sura()
		SkillCodes.ANNIHILATION:
			Annihilation()
		SkillCodes.SOUL_STRIKE:
			SoulStrike()
		SkillCodes.FIRST_STRIKE:
			FirstStrike()
