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
var speed:float = 500
var jumpHeight:float = -20000
var isGrounded:bool = false

func _physics_process(delta: float) -> void:
	GetGrounded()
	GetInput()
	var xMove:float = moveDir * speed
	var yMove:float = 0
	if !isGrounded:
		jump = false
		#print_debug("falling")
		yMove += 198
	else:
		if jump:
			yMove = jumpHeight
			#print_debug("jumping")
		else:
			yMove = 0
			#print_debug("grounded")
	moveChar(xMove, yMove)

func GetGrounded():
	if groundRay.is_colliding():
		var colClass = groundRay.get_collider().get_class()
		var colName = groundRay.get_collider().get_property_list()
		if colClass == "StaticBody2D":
			isGrounded = true
			print_debug(colName[2])
		else:
			isGrounded = false
			print_debug(colName[0])
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
	velocity.y = yMove
	if jump:
		velocity.y = move_toward(position.y, velocity.y, speed)
	
	if xMove: #apply horizontal movement
		velocity.x = xMove
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide() #move

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
