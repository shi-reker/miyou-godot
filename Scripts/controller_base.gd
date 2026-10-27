extends CharacterBody2D
class_name Controller

@export var groundRay:RayCast2D
@export var sprite:Sprite2D
@export var weapon:Weapon
var charClass:Class_base

var health:float
var defense:float
var dmg:float
var mana:float
var speed:float
var jumpHeight:float
var moveDir:float

var jump:bool
var attack:bool

var jumpTime:float = 0.1
var fallSpeed:float = 14
var airTime:float = 0
var xMomentum:float = 0

var isGrounded:bool = false
var isJumping:bool = false

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
	pass

func MoveChar(xMove:float, yMove:float):
	velocity.y += yMove
	
	if xMove: #apply horizontal movement
		velocity.x = xMove
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	UpdateVisuals(xMove)
	move_and_slide() #move

func UpdateVisuals(xMove:float):
	if xMove < 0:
		sprite.flip_h = true
		if weapon.position.x > 0 and weapon.isAttacking == false:
			weapon.position.x *= -1
			weapon.hitbox.rotation *= -1
			weapon.hitbox.position.x *= -1
			weapon.sprite.flip_h = true
			weapon.isFlipped = true
	elif xMove > 0:
		sprite.flip_h = false
		if weapon.position.x < 0 and weapon.isAttacking == false:
			weapon.position.x *= -1
			weapon.hitbox.rotation *= -1
			weapon.hitbox.position.x *= -1
			weapon.sprite.flip_h = false
			weapon.isFlipped = false

func TakeDamage(damage:float):
	health -= damage
	print_debug(health)
	
	if health <= 0:
		Die()

func Die():
	print_debug("ded")
	queue_free()
