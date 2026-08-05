extends CharacterBody2D
class_name Player

@onready var groundRay:RayCast2D = $"Ground Ray"
@onready var aimRay:RayCast2D = $"Aiming Ray"
@onready var weapon:Weapon = $Weapon
@onready var sprite:Sprite2D = $Sprite2D

var moveDir
var skill_1
var skill_2
var skill_3
var skill_4
var jump
var dash
var interact
var attack

var health:float = 100
var speed:float = 260
var mana:float = 100
var jumpTime:float = 0.1
var jumpHeight:float = -56
var airTime:float = 0
var fallSpeed:float = 14
var xMomentum:float = 0
var dashDur:float = 0.05
var dashTime:float = -1
var dashVal:float = 1000
var dashCD:float = 2
var atkTime:float = 0
var isGrounded:bool = false
var isJumping:bool = false
#var isAttacking:bool = false
#var cdTimers:Dictionary = {
	#DASH = 0
#}

func _ready() -> void:
	weapon.weapon_stats.alignment = weapon.weapon_stats.Allegiance.FRIENDLY

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
		weapon.isAttacking = true
		weapon.DoAttack(delta)
	elif weapon.isAttacking:
		weapon.DoAttack(delta)

func GetGrounded():
	if groundRay.is_colliding():
		var colClass = groundRay.get_collider()
		if colClass is Ground:
			isGrounded = true
			#print_debug(colName[2])
		else:
			isGrounded = false
			#print_debug(colName[0])
	else:
		isGrounded = false

func GetInput():
	moveDir = Input.get_axis("Backwards", "Forward")
	jump = Input.is_action_pressed("Jump")
	dash = Input.is_action_pressed("Dash")
	attack = Input.is_action_just_pressed("Attack")

func MoveChar(xMove:float, yMove:float):
	velocity.y += yMove
	
	if xMove: #apply horizontal movement
		velocity.x = xMove
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	UpdateVisuals(xMove)
	move_and_slide() #move

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

func UpdateVisuals(xMove:float):
	if xMove < 0:
		sprite.flip_h = true
	elif xMove > 0:
		sprite.flip_h = false

func TakeDamage(damage:float):
	health -= damage
	
	if health < 0:
		Die()

func Die():
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Weapon:
		if area.isAttacking and area.weapon_stats.alignment == area.weapon_stats.Allegiance.HOSTILE:
			var d = area.weapon_stats.dmg
			TakeDamage(d)
