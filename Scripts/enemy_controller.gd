extends Controller
class_name Enemy

@export var enemyType:Enemy_base

func _ready() -> void:
	groundRay = $"Ground Ray"
	weapon = $Weapon
	sprite = $Sprite2D
	
	enemyType = load("res://Resources/Enemies/Sub Variant/zombie_res.tres")
	charClass = load("res://Resources/Classes/Variants/no_class_res.tres")
	#weapon.stats.alignment = weapon.stats.Allegiance.HOSTILE
	sprite.texture = load(enemyType.spritePaths[enemyType.subType])
	
	health = enemyType.health
	defense = enemyType.defense
	dmg = enemyType.attack
	mana = enemyType.mana
	speed = enemyType.speed
	jumpHeight = enemyType.jumpHeight

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
	
	xMove += xMomentum
	
	MoveChar(xMove, yMove)

func GetInput():
	moveDir = randf()
	if moveDir < 0.5:
		moveDir = 1
		moveDir *= -1
	else:
		moveDir = 1
	#jump = Input.is_action_pressed("Jump")
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	#print_debug("entered")
	if area is Weapon:
		#print_debug("weapon")
		if area.isAttacking and area.stats.alignment == area.stats.Allegiance.FRIENDLY:
			var d = area.dmg
			TakeDamage(d)
	elif area is Projectile:
		if area.hostility == Weapon_base.Allegiance.FRIENDLY:
			var d = area.damage
			TakeDamage(d)
