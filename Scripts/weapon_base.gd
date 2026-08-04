extends Area2D
class_name Weapon

@export var weapon_stats:Weapon_base
@export var sprite:Sprite2D
@export var hitbox:CollisionShape2D

func _ready() -> void:
	sprite.texture = load(weapon_stats.sprite)
	hitbox.shape.radius = weapon_stats.collAndSpriteSizes[weapon_stats.type][0]
	hitbox.shape.height = weapon_stats.collAndSpriteSizes[weapon_stats.type][1]
	
	if weapon_stats.type == weapon_stats.WeaponTypes.SWORD:
		hitbox.position.x = hitbox.shape.height/2
	elif weapon_stats.type == weapon_stats.WeaponTypes.DAGGER:
		hitbox.position.x = hitbox.shape.height/2
	elif weapon_stats.type == weapon_stats.WeaponTypes.HEAVY:
		hitbox.position.x = hitbox.shape.height/2
	
	print_debug(hitbox.shape.radius)
	print_debug(hitbox.shape.height)

func _physics_process(delta: float) -> void:
	if weapon_stats.alignment == weapon_stats.Allegiance.FRIENDLY:
		if weapon_stats.type == weapon_stats.WeaponTypes.FIREARM:
			global_position = get_global_mouse_position()
		else:
			look_at(get_global_mouse_position())
