extends Skill_base
class_name Vanguard_skill_base

@export var skillName:SkillCodes
@export var skillType:skillActivation

enum SkillCodes {
	TACKLE,
	BASH,
	HARDEN,
	ADAPTIVE_SKIN,
	PRESS,
	ONEMAN_ARMY,
	INDOMITABLE_SOUL,
	REVERSE_DAMAGE,
	SWIFT_RECOVERY,
}

enum skillActivation {
	ACTIVE,
	PASSIVE
}

func Tackle():
	pass
func Bash():
	pass
func Harden():
	pass
func AdaptiveSkin():
	pass
func Press():
	pass
func OneManArmy():
	pass
func IndomSoul():
	pass
func RevDamage():
	pass
func SwiftRecovery():
	pass

func def() -> void:
	sName = skillName
	skillFuncs = {
	SkillCodes.TACKLE: Tackle,
	SkillCodes.BASH: Bash,
	SkillCodes.HARDEN: Harden,
	SkillCodes.ADAPTIVE_SKIN: AdaptiveSkin,
	SkillCodes.PRESS: Press,
	SkillCodes.ONEMAN_ARMY: OneManArmy,
	SkillCodes.INDOMITABLE_SOUL: IndomSoul,
	SkillCodes.REVERSE_DAMAGE: RevDamage,
	SkillCodes.SWIFT_RECOVERY: SwiftRecovery,
}
