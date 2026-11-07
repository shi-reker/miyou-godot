extends Controller
class_name Player

@export var aimRay:RayCast2D
@export var skill1:Skill_processor
@export var skill2:Skill_processor
@export var skill3:Skill_processor
@export var skill4:Skill_processor
@export var passive:Skill_processor
@export var buffs:Node2D
@export var debuffs:Node2D

var interact

var currentWeapon:Weapon_base.WeaponTypes
var atkCD:float = 0

var skillFunctions:Dictionary

const SKILL_ACTIONS: Array[String] = ["Skill 1", "Skill 2", "Skill 3", "Skill 4"]

func _ready() -> void:
	skillFunctions = {
		"Skill 1": skill1.ActivateSkill,
		"Skill 2": skill2.ActivateSkill,
		"Skill 3": skill3.ActivateSkill,
		"Skill 4": skill4.ActivateSkill
	}
	Setup("res://Resources/Classes/Variants/no_class_res.tres", Weapon_base.WeaponTypes.HEAVY)

func Setup(classPath:String, wType:Weapon_base.WeaponTypes = currentWeapon):
	charClass = load(classPath)
	weapon.Setup(wType, charClass.type)
	weapon.stats.alignment = weapon.stats.Allegiance.FRIENDLY
	weapon.dmg *= charClass.dmgMulti
	currentWeapon = wType
	
	health = 100 * charClass.healthMulti
	defense = 20 * charClass.defMulti
	speed = 260 * charClass.spdMulti
	mana = 100 * charClass.manaMulti
	jumpHeight = -56

func _physics_process(delta: float) -> void:
	GetGrounded()
	GetInput()
	
	var xMove:float = moveDir * speed
	var yMove:float = 0
	
	if isJumping:
		airTime += delta
		if airTime < jumpTime and isGrounded:
			isGrounded = false
		elif airTime > jumpTime and !isGrounded:
			isJumping = false
			airTime = 0
		else:
			isJumping = true
			print_debug(delta)
	
	if !isGrounded:
		xMove *= 0.4
		if !isJumping:
			jump = false
			yMove = fallSpeed
		else:
			yMove = jumpHeight
	else:
		if jump:
			xMomentum = xMove
			isJumping = true
			yMove = jumpHeight
		else:
			xMomentum = 0
			yMove = 0
	
	#xMove = DoDash(delta, xMove)
	xMove += xMomentum
	MoveChar(xMove, yMove)
	
	atkCD += delta
	if attack and !weapon.isAttacking:
		if atkCD >= weapon.atkSpeed:
			atkCD = 0
			weapon.DoAttack()

func _unhandled_input(event: InputEvent) -> void:
	for i in SKILL_ACTIONS.size():
		if event.is_action_pressed(SKILL_ACTIONS[i]):
			skillFunctions[SKILL_ACTIONS[i]].call(self, self)
			return

func GetInput():
	moveDir = Input.get_axis("Backwards", "Forward")
	jump = Input.is_action_pressed("Jump")
	attack = Input.is_action_pressed("Attack")
	#print_debug(attack)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Weapon:
		if area.isAttacking and area.stats.alignment == area.stats.Allegiance.HOSTILE:
			var d = area.dmg
			TakeDamage(d)
	elif area is Projectile:
		if area.hostility == Weapon_base.Allegiance.HOSTILE:
			var d = area.damage
			TakeDamage(d)
