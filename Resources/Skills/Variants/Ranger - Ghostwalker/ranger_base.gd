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

func activate() -> void:
	match skillName:
		SkillCodes.FLICKER:
			prog = 0
		SkillCodes.SPIKE_MINE:
			prog = 0
		SkillCodes.GHOST_STEP:
			prog = 0
		SkillCodes.WISP:
			prog = 0
		SkillCodes.POISON_MIST:
			prog = 0
		SkillCodes.IGNITE:
			prog = 0
		SkillCodes.SPARK:
			prog = 0
		SkillCodes.COULD_STRIDE:
			prog = 0
		SkillCodes.SILENCE:
			prog = 0

func tick(delta: float) -> void:
	match skillName:
		SkillCodes.FLICKER: 
			Flicker()
		SkillCodes.SPIKE_MINE: 
			SpikeMine()
		SkillCodes.GHOST_STEP: 
			GhostStep()
		SkillCodes.WISP: 
			Wisp()
		SkillCodes.POISON_MIST: 
			PoisonMist()
		SkillCodes.IGNITE: 
			Ignite()
		SkillCodes.SPARK: 
			Spark()
		SkillCodes.COULD_STRIDE: 
			CloudStride()
		SkillCodes.SILENCE: 
			Silence()
