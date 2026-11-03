extends Area2D
class_name Weapon

@export var stats:Weapon_base
@export var sprite:Sprite2D
@export var hitbox:CollisionShape2D

@onready var projectile = load("res://Scenes/projectile.tscn")

var pTextures:Array = [
	"res://Assets/Sprites/Weapons/projectiles/Pellet.png", "res://Assets/Sprites/Weapons/projectiles/Bullet.png", 
	"res://Assets/Sprites/Weapons/projectiles/Rail_Projectile.png", "res://Assets/Sprites/Weapons/projectiles/Card1.png",
	"res://Assets/Sprites/Weapons/projectiles/Arrow.png", "res://Assets/Sprites/Weapons/projectiles/Needle.png"
]

var isFlipped:bool = false
var isAttacking:bool = false
var atkSpeed:float
var dmg:float
var attributes:Array
var effects:Array

func _ready() -> void:
	if stats:
		Setup(7, 7)
	else:
		stats = load("res://Resources/Weapons/Sub Variants/no_weapon_res.tres")
		dmg = stats.dmg
		atkSpeed = 1/stats.atkSpeed

func Setup(type:int, form:int):
	sprite.flip_h = false
	if type < 7 and form < 8:
		stats = load("res://Resources/Weapons/Sub Variants/"+stats.transformations[type][form]+"_res.tres")
	
	sprite.texture = stats.sprite
	hitbox.shape.radius = stats.hitboxDims[0]
	hitbox.shape.height = stats.hitboxDims[1]
	dmg = stats.dmg
	atkSpeed = 1/stats.atkSpeed
	
	match stats.type:
		stats.WeaponTypes.SWORD:
			hitbox.position.x = hitbox.shape.height/2.5
			hitbox.rotation_degrees = 45
		stats.WeaponTypes.DAGGER:
			hitbox.position.x = hitbox.shape.height/3.5
			hitbox.rotation_degrees = 45
		stats.WeaponTypes.HEAVY:
			hitbox.position.x = hitbox.shape.height/3.5
			hitbox.rotation_degrees = 45
		stats.WeaponTypes.POLEARM:
			hitbox.rotation_degrees = 90
		_:
			pass
	
	if isFlipped:
		sprite.flip_h = true
		hitbox.rotation *= -1
		hitbox.position.x *= -1

func _physics_process(delta: float) -> void:
	if stats.alignment == stats.Allegiance.FRIENDLY:
		if stats.type == stats.WeaponTypes.FIREARM:
			hitbox.global_position = get_global_mouse_position()

func DoAttack():
	if isAttacking:
		return
	#print_debug("atk")
	var thrustStart
	var thrustEnd
	var coorScale = hitbox.shape.height
	var hStartCoor = position.x - coorScale/4
	var hEndCoor = position.x + coorScale/4
	
	match stats.type:
		stats.WeaponTypes.SWORD:
			if isFlipped:
				hStartCoor = position.x + coorScale/4
				hEndCoor = position.x - coorScale/4
			thrustStart = Vector2(hStartCoor, position.y - coorScale/2)
			thrustEnd = Vector2(hEndCoor, position.y + coorScale/6)
			Thrust(thrustStart, thrustEnd)
			Swing()
		stats.WeaponTypes.DAGGER:
			if isFlipped:
				hStartCoor = position.x + coorScale/4
				hEndCoor = position.x - coorScale/4
			thrustStart = Vector2(hStartCoor, position.y - coorScale/3)
			thrustEnd = Vector2(hEndCoor, position.y + coorScale/3)
			Thrust(thrustStart, thrustEnd)
			Swing()
		stats.WeaponTypes.HEAVY:
			if isFlipped:
				hStartCoor = position.x + coorScale/4
				hEndCoor = position.x - coorScale/4
			thrustStart = Vector2(hStartCoor, position.y - coorScale/2)
			thrustEnd = Vector2(hEndCoor, position.y + coorScale/6)
			Thrust(thrustStart, thrustEnd)
			Swing()
		stats.WeaponTypes.FIREARM:
			Shoot()
		stats.WeaponTypes.DEX:
			Swing()
		stats.WeaponTypes.UNARMED:
			hEndCoor = position.x + coorScale/3
			if isFlipped:
				hStartCoor = position.x + coorScale/4
				hEndCoor = position.x - coorScale/3
			thrustStart = Vector2(hStartCoor, position.y)
			thrustEnd = Vector2(hEndCoor, position.y)
			Thrust(thrustStart, thrustEnd)
		stats.WeaponTypes.POLEARM:
			hEndCoor = position.x + coorScale/1.5
			if isFlipped:
				hStartCoor = position.x + coorScale/4
				hEndCoor = position.x - coorScale/1.5
			thrustStart = Vector2(hStartCoor, position.y)
			thrustEnd = Vector2(hEndCoor, position.y)
			Thrust(thrustStart, thrustEnd)

func Swing():
	var oriRotation = rotation
	var startRotation = oriRotation - PI/2   # back
	var endtRotation = oriRotation + PI/3  # forward
	
	if isFlipped:
		startRotation *= -1
		endtRotation *= -1
	
	rotation = startRotation
	isAttacking = true
	
	var tween = create_tween()
	tween.tween_property(self, "rotation", endtRotation, 0.08)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation", oriRotation, 0.18)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(func(): isAttacking = false)

func Thrust(startPos:Vector2, endPos:Vector2):
	var oriPos = position
	
	position = startPos
	isAttacking = true
	
	var tween = create_tween()
	tween.tween_property(self, "position", endPos, 0.08)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", oriPos, 0.18)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(func(): isAttacking = false)

func Shoot():
	var t:Texture2D
	match stats.subType:
		0:
			t = load(pTextures[0])
		1, 2, 4, 7:
			t = load(pTextures[1])
		3:
			t = load(pTextures[2])
		5:
			t = load(pTextures[3])
		6:
			t = load(pTextures[4])
	var bullet:Projectile = projectile.instantiate()
	get_parent().get_parent().add_child(bullet)
	bullet.Setup(dmg, 1200, stats.alignment, [5, 30], t, global_position, hitbox.global_position)
