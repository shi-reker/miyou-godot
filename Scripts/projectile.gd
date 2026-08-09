extends Area2D
class_name Projectile

@export var hitbox:CollisionShape2D
@export var sprite:Sprite2D

var damage:float
var speed:float
var hostility:int
var target:Vector2
var direction:Vector2
var initPos:Vector2

func Setup(dmg:float, spd:float, host:int, dim:Array, pic:Texture2D, init:Vector2, dest:Vector2):
	damage = dmg
	speed = spd
	hostility = host
	hitbox.shape.radius = dim[0]
	hitbox.shape.height = dim[1]
	sprite.texture = pic
	target = dest
	initPos = init
	position = init
	
	direction = (target - global_position).normalized()
	rotation = direction.angle()

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
	if global_position.distance_to(initPos) > 1500.0:  # despawn if too far
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		queue_free()
