extends Area2D
class_name Weapon

@export var weapon_stats:Weapon_base
@export var sprite:Sprite2D
@export var hitbox:CollisionShape2D

var isAttacking:bool = false
var atkDur:float = 0

func _ready() -> void:
	if weapon_stats:
		setup()
	else:
		weapon_stats = load("res://Resources/Weapons/Variants/no_weapon_res.tres")

func setup():
	sprite.texture = weapon_stats.sprite
	hitbox.shape.radius = weapon_stats.collAndSpriteSizes[weapon_stats.type][0]
	hitbox.shape.height = weapon_stats.collAndSpriteSizes[weapon_stats.type][1]
	
	match weapon_stats.type:
		weapon_stats.WeaponTypes.SWORD:
			hitbox.position.x = hitbox.shape.height/2.5
			hitbox.rotation_degrees = 45
		weapon_stats.WeaponTypes.DAGGER:
			hitbox.position.x = hitbox.shape.height/3.5
			hitbox.rotation_degrees = 45
		weapon_stats.WeaponTypes.HEAVY:
			hitbox.position.x = hitbox.shape.height/3.5
			hitbox.rotation_degrees = 45
		weapon_stats.WeaponTypes.POLEARM:
			hitbox.rotation_degrees = 90
		_:
			pass

func _physics_process(delta: float) -> void:
	if weapon_stats.alignment == weapon_stats.Allegiance.FRIENDLY:
		if weapon_stats.type == weapon_stats.WeaponTypes.FIREARM:
			global_position = get_global_mouse_position()
	
	pass

func DoAttack():
	if isAttacking:
		return
	print_debug("atk")
	var thrustStart
	var thrustEnd
	var coorScale = hitbox.shape.height
	
	match weapon_stats.type:
		weapon_stats.WeaponTypes.SWORD:
			thrustStart = Vector2(position.x - coorScale/4, position.y - coorScale/2)
			thrustEnd = Vector2(position.x + coorScale/4, position.y + coorScale/6)
			Thrust(thrustStart, thrustEnd)
			Swing()
		weapon_stats.WeaponTypes.DAGGER:
			thrustStart = Vector2(position.x - coorScale/4, position.y - coorScale/3)
			thrustEnd = Vector2(position.x + coorScale/4, position.y + coorScale/3)
			Thrust(thrustStart, thrustEnd)
			Swing()
		weapon_stats.WeaponTypes.HEAVY:
			thrustStart = Vector2(position.x - coorScale/4, position.y - coorScale/2)
			thrustEnd = Vector2(position.x + coorScale/4, position.y + coorScale/6)
			Thrust(thrustStart, thrustEnd)
			Swing()
		weapon_stats.WeaponTypes.FIREARM:
			Shoot()
		weapon_stats.WeaponTypes.DEX:
			Swing()
		weapon_stats.WeaponTypes.UNARMED:
			thrustStart = Vector2(position.x - coorScale/4, position.y)
			thrustEnd = Vector2(position.x + coorScale/3, position.y)
			Thrust(thrustStart, thrustEnd)
		weapon_stats.WeaponTypes.POLEARM:
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
	hitbox.disabled = false
	isAttacking = true
	hitbox.disabled = true
	isAttacking = false
	print_debug("shoot")
