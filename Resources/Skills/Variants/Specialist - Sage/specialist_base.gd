extends Skill_base
class_name Specialist_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	ENCHANT,
	CURSE,
	SHIELD,
	ROOT,
	SIPHON,
	CONFUSE,
	TELEPORTATION,
	SUMMON_BEASTS,
	DEFIERS_BLESSING,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func Enchant():
	pass
func Curse():
	pass
func Shield():
	pass
func Root():
	pass
func Siphon():
	pass
func Confuse():
	pass
func Teleport():
	pass
func SummonBeast():
	pass
func DefierBlessing():
	pass

var skillFuncs: Dictionary[SkillCodes, Callable] = {
	SkillCodes.ENCHANT: Enchant,
	SkillCodes.CURSE: Curse,
	SkillCodes.SHIELD: Shield,
	SkillCodes.ROOT: Root,
	SkillCodes.SIPHON: Siphon,
	SkillCodes.CONFUSE: Confuse,
	SkillCodes.TELEPORTATION: Teleport,
	SkillCodes.SUMMON_BEASTS: SummonBeast,
	SkillCodes.DEFIERS_BLESSING: DefierBlessing,
}
