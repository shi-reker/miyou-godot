extends Controller
class_name Player

@onready var aimRay:RayCast2D = $"Aiming Ray"
var wTypeRef:Weapon_base

var skill_1
var skill_2
var skill_3
var skill_4
var dash
var interact

var dashDur:float = 0.05
var dashTime:float = -1
var dashVal:float = 1000
var dashCD:float = 2
#var isAttacking:bool = false
#var cdTimers:Dictionary = {
	#DASH = 0
#}

func _ready() -> void:
	groundRay = $"Ground Ray"
	weapon = $Weapon
	sprite = $Sprite2D
	
	charClass = load("res://Resources/Classes/Variants/no_class_res.tres")
	#print_debug(charClass.type)
	#weapon.stats = load("res://Resources/Weapons/Variants/sword_res.tres")
	weapon.Setup(wTypeRef.WeaponTypes.FIREARM, charClass.type)
	weapon.stats.alignment = weapon.stats.Allegiance.FRIENDLY
	weapon.dmg *= charClass.dmgMulti
	
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
	
	xMove = DoDash(delta, xMove)
	xMove += xMomentum
	
	MoveChar(xMove, yMove)
	
	if attack and !weapon.isAttacking:
		weapon.DoAttack()

func GetInput():
	moveDir = Input.get_axis("Backwards", "Forward")
	jump = Input.is_action_pressed("Jump")
	dash = Input.is_action_pressed("Dash")
	attack = Input.is_action_just_pressed("Attack")

func DoDash(delta:float, xMove:float) -> float:
	if dashTime < 0 and dashCD >= 2:
		if dash:
			dashTime = 0
			dashCD = 0
		else:
			return xMove
	
	if dashTime >= 0 and dashTime <= dashDur:
		dashTime += delta
		#dashCD -= delta
		if xMove < 0:
			xMove -= dashVal
		else:
			xMove += dashVal
	else:
		dashTime = -1
		if dashCD < 2:
			dashCD += delta
			print_debug(dashCD)
	
	return xMove

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Weapon:
		if area.isAttacking and area.stats.alignment == area.stats.Allegiance.HOSTILE:
			var d = area.dmg
			TakeDamage(d)
	elif area is Projectile:
		if area.hostility == Weapon_base.Allegiance.HOSTILE:
			var d = area.damage
			TakeDamage(d)
