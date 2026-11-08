extends Skill_base
class_name Ranger_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	FLICKER,
	SPIKE_MINE,
	GHOST_STEP,
	WISP,
	POISON_MIST,
	IGNITE,
	SPARK,
	COULD_STRIDE,
	SILENCE,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func Flicker():
	pass
func SpikeMine():
	pass
func GhostStep():
	pass
func Wisp():
	pass
func PoisonMist():
	pass
func Ignite():
	pass
func Spark():
	pass
func CloudStride():
	pass
func Silence():
	pass

func def() -> void:
	sName = skillName
	skillFuncs = {
	SkillCodes.FLICKER: Flicker,
	SkillCodes.SPIKE_MINE: SpikeMine,
	SkillCodes.GHOST_STEP: GhostStep,
	SkillCodes.WISP: Wisp,
	SkillCodes.POISON_MIST: PoisonMist,
	SkillCodes.IGNITE: Ignite,
	SkillCodes.SPARK: Spark,
	SkillCodes.COULD_STRIDE: CloudStride,
	SkillCodes.SILENCE: Silence,
}
