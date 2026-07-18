extends CharacterBody2D
class_name Player

@onready var groundRay:RayCast2D = $RayCast2D
var moveDir
var skill_1
var skill_2
var skill_3
var skill_4
var jump
var dash
var interact
var speed:float = 260
var jumpTime:float = 0.1
var jumpHeight:float = -56
var airTime:float = 0
var fallSpeed:float = 14
var xMomentum:float = 0
var isGrounded:bool = false
var isJumping:bool = false

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
			print_debug("fall")
		else:
			isJumping = true
	
	if !isGrounded:
		xMove *= 0.4
		if !isJumping:
			jump = false
			print_debug("falling")
			yMove = fallSpeed
		else:
			yMove = jumpHeight
			print_debug("jumping")
	else:
		if jump:
			xMomentum = xMove
			isJumping = true
			yMove = jumpHeight
			print_debug("up")
		else:
			xMomentum = 0
			yMove = 0
			print_debug("grounded")
	
	xMove += xMomentum
	moveChar(xMove, yMove)

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
		#if colClass == "CollisionShape2D" and colName[name] == "Floor":
			#isGrounded = true
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

func moveChar(xMove:float, yMove:float):
	velocity.y += yMove
	
	if xMove: #apply horizontal movement
		velocity.x = xMove
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide() #move

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
