extends Skill_base
class_name Artillery_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	SHATTERING_IMPACT,
	AMPLIFICATION,
	BLAST_STRIKE,
	CHARGE_UP,
	DEPLOY_BARRIER,
	NULLIFICATION,
	VACUUM_IMPLOSION,
	EMERGENCY_KIT,
	DECIMATION,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func ShatterImpact():
	pass
func Amp():
	pass
func BlastStrike():
	pass
func ChargeUp():
	pass
func Barrier():
	pass
func Nullification():
	pass
func VacImplosion():
	pass
func EmKit():
	pass
func Decimation():
	pass

func activate() -> void:
	match skillName:
		SkillCodes.SHATTERING_IMPACT:
			prog = 0
		SkillCodes.AMPLIFICATION:
			prog = 0
		SkillCodes.BLAST_STRIKE:
			prog = 0
		SkillCodes.CHARGE_UP:
			prog = 0
		SkillCodes.DEPLOY_BARRIER:
			prog = 0
		SkillCodes.NULLIFICATION:
			prog = 0
		SkillCodes.VACUUM_IMPLOSION:
			prog = 0
		SkillCodes.EMERGENCY_KIT:
			prog = 0
		SkillCodes.DECIMATION:
			prog = 0

func tick(delta: float) -> void:
	match skillName:
		SkillCodes.SHATTERING_IMPACT: 
			ShatterImpact()
		SkillCodes.AMPLIFICATION: 
			Amp()
		SkillCodes.BLAST_STRIKE: 
			BlastStrike()
		SkillCodes.CHARGE_UP: 
			ChargeUp()
		SkillCodes.DEPLOY_BARRIER: 
			Barrier()
		SkillCodes.NULLIFICATION: 
			Nullification()
		SkillCodes.VACUUM_IMPLOSION: 
			VacImplosion()
		SkillCodes.EMERGENCY_KIT: 
			EmKit()
		SkillCodes.DECIMATION: 
			Decimation()
