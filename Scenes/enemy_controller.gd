extends CharacterBody2D
class_name Enemy

@export var enemyType:Enemy_base
@onready var groundRay:RayCast2D = $"Ground Ray"
@onready var weapon:Weapon = $Weapon
@onready var sprite:Sprite2D = $Sprite2D

var moveDir:float
var jump:bool
var airTime:float = 0
var xMomentum:float = 0

var isGrounded:bool = false
var isJumping:bool = false

func _ready() -> void:
	enemyType = load("res://Resources/Enemies/Sub Variant/zombie_res.tres")
	weapon.weapon_stats.alignment = weapon.weapon_stats.Allegiance.HOSTILE
	sprite.texture = load(enemyType.spritePaths[enemyType.subType])

func _physics_process(delta: float) -> void:
	GetGrounded()
	GetInput()
	
	var xMove:float = moveDir * enemyType.speed
	var yMove:float = 0
	
	if isJumping:
		airTime += delta
		if airTime < enemyType.jumpTime and isGrounded:
			isGrounded = false
		elif airTime > enemyType.jumpTime and !isGrounded:
			isJumping = false
			airTime = 0
		else:
			isJumping = true
	
	if !isGrounded:
		xMove *= 0.4
		if !isJumping:
			jump = false
			yMove = enemyType.fallSpeed
		else:
			yMove = enemyType.jumpHeight
	else:
		if jump:
			xMomentum = xMove
			isJumping = true
			yMove = enemyType.jumpHeight
		else:
			xMomentum = 0
			yMove = 0
	
	xMove += xMomentum
	
	MoveChar(xMove, yMove)

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
	#moveDir = Input.get_axis("Backwards", "Forward")
	#jump = Input.is_action_pressed("Jump")
	pass

func MoveChar(xMove:float, yMove:float):
	velocity.y += yMove
	
	if xMove: #apply horizontal movement
		velocity.x = xMove
	else:
		velocity.x = move_toward(velocity.x, 0, enemyType.speed)
	
	UpdateVisuals(xMove)
	move_and_slide() #move

func UpdateVisuals(xMove:float):
	if xMove < 0:
		sprite.flip_h = true
	elif xMove > 0:
		sprite.flip_h = false
