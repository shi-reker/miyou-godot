extends CharacterBody2D
class_name Player

@onready var groundRay:RayCast2D = $"Ground Ray"
@onready var aimRay:RayCast2D = $"Aiming Ray"
@onready var Weapon:Area2D = $Weapon

var moveDir
var skill_1
var skill_2
var skill_3
var skill_4
var jump
var dash
var interact

var health:float = 100
var speed:float = 260
var jumpTime:float = 0.1
var jumpHeight:float = -56
var airTime:float = 0
var fallSpeed:float = 14
var xMomentum:float = 0
var dashDur:float = 0.05
var dashTime:float = -1
var dashVal:float = 1000
var dashCD:float = 2
var isGrounded:bool = false
var isJumping:bool = false
#var cdTimers:Dictionary = {
	#DASH = 0
#}

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

func GetGrounded():
	if groundRay.is_colliding():
		var colClass = groundRay.get_collider().get_class()
		var colName = groundRay.get_collider().get_property_list()
		if colClass == "StaticBody2D":
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
	skill_1 = Input.is_action_pressed("Skill 1")
	skill_2 = Input.is_action_pressed("Skill 2")
	skill_3 = Input.is_action_pressed("Skill 3")
	skill_4 = Input.is_action_pressed("Skill 4")
	interact = Input.is_action_pressed("Interact")

func MoveChar(xMove:float, yMove:float):
	velocity.y += yMove
	
	if xMove: #apply horizontal movement
		velocity.x = xMove
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
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


func _on_body_entered(body: Node2D) -> void:
	if body is Ground:
		isGrounded = true
	else:
		isGrounded = false

func _on_body_exited(body: Node2D) -> void:
	if body is Ground:
		isGrounded = false
