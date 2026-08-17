extends Area2D
class_name Weapon

@export var stats:Weapon_base
@export var sprite:Sprite2D
@export var hitbox:CollisionShape2D

@onready var projectile = load("res://Scenes/projectile.tscn")

var isAttacking:bool = false
var atkDur:float = 0
var dmg:float
var doneAttacking:bool = false
var attributes:Array
var effects:Array

func _ready() -> void:
	if stats:
		Setup(7, 7)
	else:
		stats = load("res://Resources/Weapons/Sub Variants/no_weapon_res.tres")
		dmg = stats.dmg

func Setup(type:int, form:int):
	if type < 7 and form < 8:
		stats = load("res://Resources/Weapons/Sub Variants/"+stats.transformations[type][form]+"_res.tres")
	
	sprite.texture = stats.sprite
	hitbox.shape.radius = stats.hitboxDims[0]
	hitbox.shape.height = stats.hitboxDims[1]
	dmg = stats.dmg
	
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

func _physics_process(delta: float) -> void:
	if stats.alignment == stats.Allegiance.FRIENDLY:
		if stats.type == stats.WeaponTypes.FIREARM:
			hitbox.global_position = get_global_mouse_position()
	
	#if doneAttacking:
		#dmg = stats.dmg

func DoAttack():
	if isAttacking:
		return
	print_debug("atk")
	var thrustStart
	var thrustEnd
	var coorScale = hitbox.shape.height
	
	#dmg *= multi
	
	match stats.type:
		stats.WeaponTypes.SWORD:
			thrustStart = Vector2(position.x - coorScale/4, position.y - coorScale/2)
			thrustEnd = Vector2(position.x + coorScale/4, position.y + coorScale/6)
			Thrust(thrustStart, thrustEnd)
			Swing()
		stats.WeaponTypes.DAGGER:
			thrustStart = Vector2(position.x - coorScale/4, position.y - coorScale/3)
			thrustEnd = Vector2(position.x + coorScale/4, position.y + coorScale/3)
			Thrust(thrustStart, thrustEnd)
			Swing()
		stats.WeaponTypes.HEAVY:
			thrustStart = Vector2(position.x - coorScale/4, position.y - coorScale/2)
			thrustEnd = Vector2(position.x + coorScale/4, position.y + coorScale/6)
			Thrust(thrustStart, thrustEnd)
			Swing()
		stats.WeaponTypes.FIREARM:
			Shoot()
		stats.WeaponTypes.DEX:
			Swing()
		stats.WeaponTypes.UNARMED:
			thrustStart = Vector2(position.x - coorScale/4, position.y)
			thrustEnd = Vector2(position.x + coorScale/3, position.y)
			Thrust(thrustStart, thrustEnd)
		stats.WeaponTypes.POLEARM:
			thrustStart = Vector2(position.x - coorScale/4, position.y)
			thrustEnd = Vector2(position.x + coorScale/1.5, position.y)
			Thrust(thrustStart, thrustEnd)
	

func Swing():
	var oriRotation = rotation
	var startRotation = oriRotation - PI/2   # back
	var endtRotation = oriRotation + PI/3  # forward
	
	rotation = startRotation
	isAttacking = true
	
	var tween = create_tween()
	tween.tween_property(self, "rotation", endtRotation, 0.08)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation", oriRotation, 0.18)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(func(): isAttacking = false)
	
	#dmg = dmgCache

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
	
	#dmg = dmgCache

func Shoot():
	var t:Texture2D = load("res://Assets/Sprites/Weapons/projectiles/Bullet.png")
	var bullet:Projectile = projectile.instantiate()
	get_parent().get_parent().add_child(bullet)
	bullet.Setup(dmg, 1200, stats.alignment, [5, 30], t, global_position, hitbox.global_position)
	#dmg = stats.dmg
